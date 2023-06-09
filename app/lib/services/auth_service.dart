import 'package:app/pages/login_page.dart';
import 'package:app/pages/register_validation_help.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app/models/user_model.dart';

import '../pages/home_page_ca.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  registrar(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este email já está cadastrado');
      } else {
        AuthException('e.code');
      }
    }
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email não encontrado. Cadastre-se.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente');
      } else {
        AuthException('e.code');
      }
    }
  }

  logout(context) async {
    await _auth
        .signOut()
        .then((value) => {
              Fluttertoast.showToast(msg: "Deslogado com sucesso"),
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              ),
            })
        .catchError((error) {
      Fluttertoast.showToast(msg: error!.message);
    });
    _getUser();
  }

  // other wat ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
  void signIn(
    BuildContext context,
    String matricula,
    String senha,
    GlobalKey<FormState> formKey,
  ) async {
    if (formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: matricula, password: senha)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Logado com sucesso"),
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomePageCa(),
                  ),
                ),
              })
          .catchError(
        (e) {
          Fluttertoast.showToast(msg: e!.message);
          _getUser();
        },
      );
      _getUser();
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text('Usuário não cadastrado !'),
              content: const Text('Cadastre-se para continuar'),
              actions: <Widget>[
                // define os botões na base do dialogo
                TextButton(
                  child: const Text("Fechar"),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterValidationHelpPageWidget()));
                  },
                ),
              ],
            );
          });
    }
  }

  signUp(
    BuildContext context,
    String email,
    String senha,
    GlobalKey<FormState> formKey,
    TextEditingController? texMatriculaController,
    TextEditingController? texEmailController,
    TextEditingController? texSenhaController,
    TextEditingController? texConfSenhaController,
  ) async {
    if (formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: senha)
          .then((value) => {
                postDetailsToFirestore(
                  context,
                  texMatriculaController,
                  texEmailController,
                  texSenhaController,
                  texConfSenhaController,
                ),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
      _getUser();
    }
  }

  postDetailsToFirestore(
    BuildContext context,
    TextEditingController? texMatriculaController,
    TextEditingController? texEmailController,
    TextEditingController? texSenhaController,
    TextEditingController? texConfSenhaController,
  ) async {
    // * Calling Firestore
    // * Calling User Model
    // * Sending these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // * Writing all the values
    userModel.uId = user!.uid;
    userModel.userMatricula = texMatriculaController!.text;
    userModel.userEmail = texEmailController!.text;
    userModel.userSenha = texSenhaController!.text;
    userModel.userConfSenha = texConfSenhaController!.text;

    await firebaseFirestore.collection("usuario").doc(user.uid).set(userModel.toMap());
    Fluttertoast.showToast(msg: "Conta criada com sucesso");

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const RegisterValidationHelpPageWidget()), (route) => false);
  }
}
