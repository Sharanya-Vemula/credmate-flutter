import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../models/product.dart';
import '../providers/user_provider.dart';
import '../providers/loan_provider.dart';
import '../services/mock_api.dart';
import '../utils/amortization.dart';
import 'approval_screen.dart';

class CheckoutScreen extends StatefulWidget {
  static const routeName = '/checkout';

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _tenure = 3;
  double _downpayment = 0.0;
  double _interestRate = 12.0;
  bool _loading = false;

  final formatter = NumberFormat.currency(locale: 'en_IN', symbol: '₹');

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    final user = Provider.of<UserProvider>(context, listen: false).user;

    final principal = (product.price - _downpayment).clamp(0, double.infinity);
    final emi = calculateEMI(
      principal.toDouble(),
      _interestRate.toDouble(),
      _tenure,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product title
            Text(
              product.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(product.description),
            const SizedBox(height: 12),
            Text('Price: ${formatter.format(product.price)}'),
            const Divider(height: 30),

            // Downpayment
            const Text('Downpayment'),
            Slider(
              value: _downpayment,
              min: 0,
              max: product.price * 0.5,
              divisions: 5,
              label: formatter.format(_downpayment),
              onChanged: (v) => setState(() => _downpayment = v),
            ),

            // Tenure selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tenure (months)',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                DropdownButton<int>(
                  value: _tenure,
                  items: [3, 6, 9, 12]
                      .map((m) =>
                          DropdownMenuItem(value: m, child: Text('$m months')))
                      .toList(),
                  onChanged: (v) => setState(() => _tenure = v ?? 3),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Principal and EMI summary
            Text('Principal: ${formatter.format(principal)}'),
            Text('Estimated EMI: ${formatter.format(emi)} / month'),
            const Spacer(),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _loading
                    ? null
                    : () async {
                        setState(() => _loading = true);

                        // 🔹 Mock credit approval
                        final ok = await MockApi.runMockApproval(
                          user.mockCreditScore,
                          principal.toDouble(),
                        );

                        setState(() => _loading = false);

                        if (ok) {
                          // 🔹 Create loan record
                          final loan = await Provider.of<LoanProvider>(
                            context,
                            listen: false,
                          ).createLoan(
                            productId: product.id,
                            principal: principal.toDouble(),
                            tenureMonths: _tenure,
                            monthlyEmi: emi,
                          );

                          // 🔹 Navigate to approval screen
                          if (!mounted) return;
                          Navigator.pushReplacementNamed(
                            context,
                            ApprovalScreen.routeName,
                            arguments: loan,
                          );
                        } else {
                          // 🔹 Show rejection dialog
                          if (!mounted) return;
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Declined'),
                              content: const Text(
                                'Credit check failed — not approved for this amount.',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: _loading
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Request BNPL',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
