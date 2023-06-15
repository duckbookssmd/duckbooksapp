import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AppSettings extends ChangeNotifier {
  late Box box;
  Map<String, String> _logindata = {
    'registration': 'Estou',
    'password': 'Triste',
  };

  Map<String, String> get logindata  {
    _startSetting();
    return _logindata;
  }

  set logindata(Map<String, String> value) {
    _logindata = value;
  }

  AppSettings() {
    _startSetting();
  }

  _startSetting() async {
    await _openbox();
    await _readData();
  }

  Future<void> _openbox() async {
    box = Hive.box('logindata');
    await _readData();
  }

  _readData() {
    final registration = box.get('registration') ?? '';
    final senha = box.get('password') ?? '';

    logindata = {
      'registration': registration,
      'password': senha,
    };
    notifyListeners();
  }

  setData(String registration, String pass) async {
    await box.put('registration', registration);
    await box.put('password', pass);
    await _readData();
    notifyListeners();
  }
}
