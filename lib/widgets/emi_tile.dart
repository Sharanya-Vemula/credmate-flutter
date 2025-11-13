import 'package:flutter/material.dart';

class EmiTile extends StatelessWidget {
  final int monthIndex;
  final double amount;
  final bool paid;
  const EmiTile({
    super.key,
    required this.monthIndex,
    required this.amount,
    required this.paid,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text('${monthIndex + 1}')),
      title: Text('EMI ${monthIndex + 1}'),
      subtitle: Text('₹${amount.toStringAsFixed(0)}'),
      trailing: paid
          ? const Icon(Icons.check_circle, color: Colors.green)
          : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
    );
  }
}
