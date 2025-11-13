class User {
final String id;
final String name;
final int mockCreditScore; // 300-900


User({required this.id, required this.name, required this.mockCreditScore});


Map<String, dynamic> toJson() => {'id': id, 'name': name, 'mockCreditScore': mockCreditScore};
factory User.fromJson(Map<String, dynamic> j) => User(id: j['id'], name: j['name'], mockCreditScore: j['mockCreditScore']);
}