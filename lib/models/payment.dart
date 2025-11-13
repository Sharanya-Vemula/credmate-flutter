class Payment {
final String id;
final double amount;
final DateTime paidAt;


Payment({required this.id, required this.amount, required this.paidAt});


Map<String, dynamic> toJson() => {'id': id, 'amount': amount, 'paidAt': paidAt.toIso8601String()};


factory Payment.fromJson(Map<String, dynamic> j) => Payment(id: j['id'], amount: (j['amount'] as num).toDouble(), paidAt: DateTime.parse(j['paidAt']));
}