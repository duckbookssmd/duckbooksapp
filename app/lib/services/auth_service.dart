import 'package:app/models/book_model.dart';
import 'package:app/pages/home_final_user.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/pages/register_validation_help.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app/models/user_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../configs/app_settings.dart';
import '../pages/home_ca.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? usuario;
  late bool isAdm;
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
    removeSaveLogin(context);
  }

  // other wat ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss

  saveLogin(BuildContext context, String registration, String password) async {
    // Salvar
    await context.read<AppSettings>().setData(registration, password);
  }

  removeSaveLogin(BuildContext context) async {
    await context.read<AppSettings>().setData('', '');
  }

  void signInWithRegistration(
    BuildContext context,
    String registration,
    String password,
    bool rememberPass,
  ) async {
    bool succesSignIn = false;
    await firebaseFirestore.collection('user').where('matriculaSIAPE', isEqualTo: registration).get().then(
      (value) async {
        if (value.docs.isEmpty) {
          Fluttertoast.showToast(msg: 'Matrícula não encontrada');
          return false;
        }
        for (var docSnapshot in value.docs) {
          String email = docSnapshot.data()['email'];
          succesSignIn = await signIn(
            context,
            email,
            password,
            docSnapshot.data()['typeAdmin'],
          );
        }
        _getUser();
      },
    ).catchError(
      (e) {
        Fluttertoast.showToast(msg: e!.message);
        _getUser();
        return false;
      },
    );
    _getUser();
    if (rememberPass && succesSignIn) {
      saveLogin(context, registration, password);
    }
  }

  Future<bool> signIn(
    BuildContext context,
    String email,
    String senha,
    bool isAdm,
  ) async {
    bool resp = false;
    await _auth.signInWithEmailAndPassword(email: email, password: senha).then((uid) {
      Fluttertoast.showToast(msg: "Logado com sucesso");
      if (isAdm) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeCa(),
          ),
        );
        this.isAdm = true;
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeFinalUse(),
          ),
        );
        this.isAdm = false;
      }
      resp = true; // sucesso ao logar
    }).catchError(
      (e) {
        if (e!.message == 'The password is invalid or the user does not have a password.') {
          Fluttertoast.showToast(msg: 'Senha inválida');
        }
        _getUser();
      },
    );
    _getUser();
    return resp; // sucesso ao logar
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

    UserModel userModel = UserModel(
      uId: user!.uid,
      matriculaSIAPE: texMatriculaController!.text,
      email: texEmailController!.text,
      pass: texSenhaController!.text,
      typeAdmin: true,
      validated: true, // Após finalizar a validação de usuários colocar pra false
    );

    // * Writing all the values

    await firebaseFirestore.collection("user").doc(user.uid).set(userModel.toMap());
    Fluttertoast.showToast(msg: "Conta criada com sucesso");

    // Não sei corrigir
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const RegisterValidationHelpPageWidget()),
      (route) => false,
    );
  }

  Future<bool> checkIfExist(String nome, String autor, String edicao) async {
    // depois trocar pra chave de identificação
    bool resp = false;
    await firebaseFirestore
        .collection('book')
        .where('nome', isEqualTo: nome)
        .where('autor', isEqualTo: autor)
        .where('edicao', isEqualTo: int.tryParse(edicao))
        .get()
        .then(
      (value) {
        if (value.docs.isEmpty || value.docs[0].data()['isDeleted'].toString() == 'true') {
          resp = false;
        } else {
          resp = true;
        }
      },
    );
    return resp;
  }

  postBookDetailsToFirestore(
    // separar em 2 funções
    TextEditingController? nomeController,
    TextEditingController? autorController,
    TextEditingController? anoController,
    TextEditingController? edicaoController,
    String? tipo,
    String? genero,
    TextEditingController? editoraController,
    bool isUpdating,
    //TextEditingController? fotoController, Por enquanto não vou colocar foto
  ) async {
    if (!await checkIfExist(nomeController!.text, autorController!.text, edicaoController!.text) || isUpdating) {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      DateFormat date = DateFormat('dd/MM/yyyy HH:mm');

      BookModel bookModel = BookModel(
        // tem como otimizar a edição
        nome: nomeController.text,
        autor: autorController.text,
        ano: int.tryParse(anoController!.text),
        edicao: int.tryParse(edicaoController.text),
        tipoMidia: tipo,
        genero: genero,
        foto: 'Colocar',
        dataCadastro: date.format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch)),
        editora: editoraController!.text,
        dataDisponibilidade: date.format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch)),
        isDeleted: false,
        userloan: null,
        admRecorder: usuario?.uid,
      );

      await firebaseFirestore.collection("book").add(bookModel.toMap());
      Fluttertoast.showToast(msg: "Obra salva no sistema!");
      if (isUpdating) {
        // edição
        await firebaseFirestore
            .collection('book')
            .where('nome', isEqualTo: bookModel.nome)
            .where('autor', isEqualTo: bookModel.autor)
            .where('edicao', isEqualTo: bookModel.edicao)
            .get()
            .then(
          (value) {
            firebaseFirestore.doc(value.docs.first.id).set(bookModel.toMap());
          },
        );
      }
    } else {
      Fluttertoast.showToast(msg: 'Livro já Cadastrado');
    }
  }

  deleteBook(
    // reduzir
    TextEditingController? nomeController,
    TextEditingController? autorController,
    TextEditingController? anoController,
    TextEditingController? edicaoController,
    String? tipo,
    String? genero,
    TextEditingController? editoraController,
    //TextEditingController? fotoController, Por enquanto não vou colocar foto
  ) async {
    if (await checkIfExist(nomeController!.text, autorController!.text, edicaoController!.text)) {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      DateFormat date = DateFormat('dd/MM/yyyy HH:mm');

      BookModel bookModel = BookModel(
          nome: nomeController.text,
          autor: autorController.text,
          ano: int.tryParse(anoController!.text),
          edicao: int.tryParse(edicaoController.text),
          tipoMidia: tipo,
          genero: genero,
          foto: 'Colocar',
          dataCadastro: date.format(
              DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch)), // pegar o datatime do dia com horas
          dataDisponibilidade: date.format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch)),
          editora: editoraController!.text,
          isDeleted: true,
          userloan: null);

      await firebaseFirestore.collection("book").doc(bookModel.nome).set(bookModel.toMap());
      Fluttertoast.showToast(msg: "Obra Deleta do sistema!");
    } else {
      Fluttertoast.showToast(msg: 'Livro Não existe no sistema');
    }
  }
}
