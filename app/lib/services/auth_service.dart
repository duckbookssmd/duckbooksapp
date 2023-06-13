import 'package:app/models/book_model.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/pages/register_validation_help.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app/models/user_model.dart';
import 'package:intl/intl.dart';

import '../pages/home_page_ca.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
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
      return error;
    });
    _getUser();
  }

  // other wat ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss

  void signInWithRegistration(
    BuildContext context,
    String registration,
    String password,
    GlobalKey<FormState> formKey,
  ) async {
      await firebaseFirestore.collection('usuario').where('matriculaSIAPE', isEqualTo: registration).get().then((value) {
        if (value.docs.isEmpty) {
          Fluttertoast.showToast(msg: 'Matrícula não encontrada');
          return false;
        }
        for (var docSnapshot in value.docs) {
          String email = docSnapshot.data()['email'];
          signIn(context, email, password, formKey);
        }
        _getUser();
      }).catchError(
        (e) {
          Fluttertoast.showToast(msg: e!.message);
          _getUser();
          return e;
        },
      );
      _getUser();
  }

  void signIn(
    BuildContext context,
    String email,
    String senha,
    GlobalKey<FormState> formKey,
  ) async {
    if (formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: senha)
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
          if (e!.message == 'The password is invalid or the user does not have a password.'){
            Fluttertoast.showToast(msg: 'Senha inválida');
          }
          _getUser();
          return e;
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
        return e;
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

    // Não sei corrigir
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const RegisterValidationHelpPageWidget()),
      (route) => false,
    );
  }

  postBookDetailsToFirestore(
    TextEditingController? nomeController,
    TextEditingController? autorController,
    TextEditingController? anoController,
    TextEditingController? edicaoController,
    TextEditingController? tipoController,
    //TextEditingController? fotoController, Por enquanto não vou colocar foto
  ) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    DateFormat date = DateFormat('dd/MM/yyyy HH:mm');

    BookModel bookModel = BookModel(
      nome: nomeController!.text,
      autor: autorController!.text,
      ano: int.tryParse(anoController!.text),
      edicao: int.tryParse(edicaoController!.text),
      tipo: tipoController!.text,
      foto: 'Colocar',
      dataCadastro: date.format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch)), // pegar o datatime do dia com horas
    );

    await firebaseFirestore.collection("obra").doc(bookModel.nome).set(bookModel.toMap());
    Fluttertoast.showToast(msg: "Obra cadastrada no sistema!");
  }
}
