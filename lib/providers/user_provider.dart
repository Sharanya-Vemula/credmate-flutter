import 'package:flutter/foundation.dart';
import '../models/user.dart';
import '../services/mock_api.dart';


class UserProvider extends ChangeNotifier {
late User _user;


User get user => _user;


UserProvider() {
_user = MockApi.fetchUser();
}


void setCreditScore(int s) {
_user = User(id: _user.id, name: _user.name, mockCreditScore: s);
notifyListeners();
}
}