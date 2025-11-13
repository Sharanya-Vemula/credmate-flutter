import 'package:flutter/material.dart';
import '../models/loan.dart';
import '../widgets/emi_tile.dart';

class RepaymentScreen extends StatelessWidget {
  static const routeName = '/repayment';

  @override
  Widget build(BuildContext context) {
    final loan = ModalRoute.of(context)!.settings.arguments as Loan;

    return Scaffold(
      appBar: AppBar(title: const Text('Repayment Schedule')),
      body: ListView.builder(
        itemCount: loan.tenureMonths,
        itemBuilder: (ctx, i) {
          final paid = i < loan.payments.length;
          return EmiTile(
            monthIndex: i,
            amount: loan.monthlyEmi,
            paid: paid,
          );
        },
      ),
    );
  }
}
