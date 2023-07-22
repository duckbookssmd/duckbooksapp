import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

/// Um simples banco de dados nativo para amezenar as informações de login do usuário.
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

  /// Ler dados já amarzenados no Box.
  _readData() {
    final registration = box.get('registration') ?? '';
    final senha = box.get('password') ?? '';

    logindata = {
      'registration': registration,
      'password': senha,
    };
    notifyListeners();
  }
  /// Escrever dados no Box
  ///
  /// Amazena o [registration] e [pass] do usuário para realizar o login na aplicação.
  setData(String registration, String pass) async {
    await box.put('registration', registration);
    await box.put('password', pass);
    await _readData();
    notifyListeners();
  }
}
