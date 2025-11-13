import 'dart:math';

double calculateEMI(double principal, double annualRatePercent, int months) {
  if (principal <= 0 || months <= 0) return 0.0;
  final monthlyRate = annualRatePercent / 12 / 100;
  final numerator = principal * monthlyRate * pow(1 + monthlyRate, months);
  final denominator = pow(1 + monthlyRate, months) - 1;
  if (denominator == 0) return principal / months;
  return numerator / denominator;
}
