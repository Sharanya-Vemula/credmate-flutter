import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/loan_provider.dart';
import '../widgets/loan_summary_card.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    final loans = Provider.of<LoanProvider>(context).loans;
    final outstanding = loans.fold<double>(0.0, (total, l) => total + l.outstanding);


    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text('Total Outstanding'),
                subtitle: Text('₹${outstanding.toStringAsFixed(0)}'),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: loans.isEmpty
                  ? const Center(child: Text('No active loans'))
                  : ListView.builder(
                      itemCount: loans.length,
                      itemBuilder: (ctx, i) =>
                          LoanSummaryCard(loan: loans[i]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
