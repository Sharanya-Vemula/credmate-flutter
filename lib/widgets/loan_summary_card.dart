import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/loan.dart';
import '../providers/product_provider.dart';
import '../providers/loan_provider.dart';

class LoanSummaryCard extends StatelessWidget {
  final Loan loan;
  const LoanSummaryCard({super.key, required this.loan});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context).findById(loan.productId);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(product?.title ?? 'Product'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Monthly EMI: ₹${loan.monthlyEmi.toStringAsFixed(0)}'),
            Text('Outstanding: ₹${loan.outstanding.toStringAsFixed(0)}'),
            Text('Next due: ${loan.nextDueDate.toLocal().toString().split(' ')[0]}'),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () async {
            await Provider.of<LoanProvider>(context, listen: false)
                .recordPayment(loan.id, loan.monthlyEmi);
          },
          child: const Text('Pay EMI'),
        ),
      ),
    );
  }
}
