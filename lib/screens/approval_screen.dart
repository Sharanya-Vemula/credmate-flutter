import 'package:flutter/material.dart';
import '../models/loan.dart';
import 'dashboard_screen.dart';

class ApprovalScreen extends StatelessWidget {
  static const routeName = '/approval';

  @override
  Widget build(BuildContext context) {
    final loan = ModalRoute.of(context)!.settings.arguments as Loan;

    return Scaffold(
      appBar: AppBar(title: const Text('Approval')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(Icons.check_circle, size: 90, color: Colors.green),
            const SizedBox(height: 20),
            const Text('BNPL Approved!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Loan ID: ${loan.id.substring(0, 8)}'),
            const SizedBox(height: 10),
            Text(
                'Monthly EMI: ₹${loan.monthlyEmi.toStringAsFixed(0)} x ${loan.tenureMonths}'),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(
                  context, DashboardScreen.routeName),
              child: const Text('Go to Dashboard'),
            )
          ],
        ),
      ),
    );
  }
}
