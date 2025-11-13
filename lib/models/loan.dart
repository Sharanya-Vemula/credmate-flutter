import 'payment.dart';


class Loan {
final String id;
final String productId;
final double principal; // amount financed after downpayment
final int tenureMonths;
final double monthlyEmi;
final DateTime startedAt;
final List<Payment> payments;


Loan({required this.id, required this.productId, required this.principal, required this.tenureMonths, required this.monthlyEmi, required this.startedAt, List<Payment>? payments}) : payments = payments ?? [];


double get outstanding => (principal - payments.fold(0.0, (t, p) => t + p.amount)).clamp(0.0, double.infinity);


DateTime get nextDueDate {
final paidMonths = payments.length;
return DateTime(startedAt.year, startedAt.month + paidMonths + 1, startedAt.day);
}


Map<String, dynamic> toJson() => {
'id': id,
'productId': productId,
'principal': principal,
'tenureMonths': tenureMonths,
'monthlyEmi': monthlyEmi,
'startedAt': startedAt.toIso8601String(),
'payments': payments.map((p) => p.toJson()).toList(),
};


factory Loan.fromJson(Map<String, dynamic> j) => Loan(
id: j['id'],
productId: j['productId'],
principal: (j['principal'] as num).toDouble(),
tenureMonths: j['tenureMonths'],
monthlyEmi: (j['monthlyEmi'] as num).toDouble(),
startedAt: DateTime.parse(j['startedAt']),
payments: (j['payments'] as List<dynamic>).map((p) => Payment.fromJson(p)).toList(),
);
}