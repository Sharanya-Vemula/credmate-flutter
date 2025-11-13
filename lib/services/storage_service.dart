import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class StorageService {
static const _loansKey = 'credmate_loans_v1';


static Future<void> saveString(String key, String value) async {
final sp = await SharedPreferences.getInstance();
await sp.setString(key, value);
}


static Future<String?> getString(String key) async {
final sp = await SharedPreferences.getInstance();
return sp.getString(key);
}


static Future<void> saveLoansJson(String json) => saveString(_loansKey, json);
static Future<String?> loadLoansJson() => getString(_loansKey);
}