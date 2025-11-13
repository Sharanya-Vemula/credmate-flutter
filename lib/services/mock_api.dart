import 'package:uuid/uuid.dart';
import '../models/product.dart';
import '../models/user.dart';


class MockApi {
static final _uuid = Uuid();


static List<Product> fetchProducts() {
return [
Product(id: 'p1', title: 'Smartphone XR', description: '6.5\" display, 128GB storage', price: 27999, image: 'assets/images/phone.png'),
Product(id: 'p2', title: 'Wireless Headphones', description: 'Active noise cancellation', price: 5999, image: 'assets/images/headphones.png'),
Product(id: 'p3', title: 'Smart Watch', description: 'Fitness tracking & notifications', price: 8999, image: 'assets/images/watch.png'),
];
}


static User fetchUser() {
return User(id: _uuid.v4(), name: 'Anita Rao', mockCreditScore: 720);
}


// Approval: allow if credit score >= 650 and principal <= 100000 (demo)
static Future<bool> runMockApproval(int creditScore, double principal) async {
await Future.delayed(Duration(milliseconds: 700));
return creditScore >= 650 && principal <= 100000;
}
}