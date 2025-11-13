import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';
import '../models/loan.dart';
import '../models/payment.dart';
import '../services/storage_service.dart';


class LoanProvider extends ChangeNotifier {
final _uuid = Uuid();
List<Loan> _loans = [];


List<Loan> get loans => _loans;


LoanProvider() {
_load();
}


Future<void> _load() async {
final jsonStr = await StorageService.loadLoansJson();
if (jsonStr != null) {
try {
final decoded = json.decode(jsonStr) as List<dynamic>;
_loans = decoded.map((e) => Loan.fromJson(e as Map<String, dynamic>)).toList();
notifyListeners();
} catch (ex) {
// ignore parse errors for demo
}
}
}


Future<void> _save() async {
final encoded = json.encode(_loans.map((l) => l.toJson()).toList());
await StorageService.saveLoansJson(encoded);
}


Future<Loan> createLoan({required String productId, required double principal, required int tenureMonths, required double monthlyEmi}) async {
final loan = Loan(id: _uuid.v4(), productId: productId, principal: principal, tenureMonths: tenureMonths, monthlyEmi: monthlyEmi, startedAt: DateTime.now());
_loans.add(loan);
await _save();
notifyListeners();
return loan;
}


Future<void> recordPayment(String loanId, double amount) async {
final loan = _loans.firstWhere((l) => l.id == loanId);
loan.payments.add(Payment(id: _uuid.v4(), amount: amount, paidAt: DateTime.now()));
await _save();
notifyListeners();
}


Future<void> clearAll() async {
_loans.clear();
await _save();
notifyListeners();
}
}