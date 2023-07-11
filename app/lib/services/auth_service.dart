import 'dart:convert';

import 'package:app/models/book_model.dart';
import 'package:app/models/loan_model.dart';
import 'package:app/models/log_model.dart';
import 'package:app/models/reservation_model.dart';
import 'package:app/models/validation_model.dart';
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
  // String? nickname;
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

  createLog({
    String? time,
    String? userId,
    String? userAdmId,
    String? action,
    String? codBook,
  }) async {
    await firebaseFirestore.collection("logs").add(LogModel(
          time: time ?? '',
          action: action ?? '',
          userId: userId ?? await getRegistrationById(usuario!.uid),
          userAdmId: userAdmId,
          codBook: codBook,
        ).toMap());
  }

  listBorrowNow(List userLoans) {
    List books = [];
    for (int i = 0; i < userLoans.length; i++) {
      // print(userLoans[i]['loan'].toString());
      if (!(userLoans[i]['loan'] == null)) {
        books.add(userLoans[i]['loan']['codBook']);
      }
    }
    return books;
  }

  checkOverdue(List userLoans) {
    if (userLoans.isEmpty) {
      return false;
    }
    for (int i = 0; i < userLoans.length; i++) {
      // print(userLoans[i]['loan'].toString());
      if (!(userLoans[i]['loan'] == null)) {
        if (DateTime.now().isAfter(DateTime.parse(
            userLoans[i]['loan']['dataDevolucao'].toString().substring(0, 10).replaceAll('/', '-').split('-').reversed.join()))) {
          return true;
        }
      }
    }
    return false;
  }

  renewLoan(dynamic book) async {
    DateFormat date = DateFormat('dd/MM/yyyy HH:mm');
    // mudar numero de renovações nos empréstimos e loans do usuário
    await firebaseFirestore
        .collection('emprestimo')
        .where('bookBorrowed', isEqualTo: await getIdByCod(book["codigo"]))
        .where('returnDate', isEqualTo: book['dataDisponibilidade'])
        .where('status', isEqualTo: 'Em dia')
        .get()
        .then((value) async {
      int numRenovations = value.docs.first.data()['renovations'] - 1; // Não pode ser 0
      bool reservated = await hasReservation(book['codigo']);
      if (numRenovations > -1 &&
          (!reservated) &&
          !DateTime.now().isAfter(
            DateTime.parse(
              book['dataDisponibilidade'].toString().substring(0, 10).replaceAll('/', '-').split('-').reversed.join(),
            ),
          )) {
        await firebaseFirestore.collection("emprestimo").doc(value.docs.first.id).update({
          "renovations": numRenovations,
          "returnDate": date
              .format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().add(const Duration(days: 15)).millisecondsSinceEpoch)),
        });
        await firebaseFirestore.collection('user').where('uId', isEqualTo: usuario!.uid).get().then((value) async {
          List userloans = value.docs.first.data()['userLoans'];
          for (int i = 0; i < userloans.length; i++) {
            if (userloans[i]["loan"]['codBook'] == book["codigo"]) {
              userloans[i]["loan"]['renovacoes'] = userloans[i]["loan"]['renovacoes'] - 1;
              userloans[i]["loan"]['dataDevolucao'] = date.format(
                  DateTime.fromMillisecondsSinceEpoch(DateTime.now().add(const Duration(days: 15)).millisecondsSinceEpoch));
            }
          }
          await firebaseFirestore.collection("user").doc(usuario!.uid).update({"userLoans": userloans});
        });
        await firebaseFirestore.collection("book").doc(await getIdByCod(book['codigo'])).update({
          "dataDisponibilidade": date
              .format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().add(const Duration(days: 15)).millisecondsSinceEpoch))
        });
        Fluttertoast.showToast(msg: 'Renovado');
      } else if (await hasReservation(book['codigo'])) {
        Fluttertoast.showToast(msg: 'Obra Reservada, impossível renovar');
      } else if (DateTime.now().isAfter(
        DateTime.parse(
          book['dataDisponibilidade'].toString().substring(0, 10).replaceAll('/', '-').split('-').reversed.join(),
        ),
      )) {
        Fluttertoast.showToast(msg: 'Obra atrasada, Por favor Devolva');
      } else {
        Fluttertoast.showToast(msg: 'Limite atingido, impossível renovar');
      }
    });
  }

  finishReservation(String bookCod) async {
    await firebaseFirestore
        .collection('reservations')
        .where('bookReservedId', isEqualTo: bookCod)
        .where('statusBook', isEqualTo: 'Solicitado')
        .where('reservationList', arrayContains: usuario!.uid)
        .get()
        .then((value) async {
      firebaseFirestore.collection('reservations').doc(value.docs.first.id).update({"statusBook": "Encerrada"});
    });
  }

  cancelReservation(String bookCod) async {
    await firebaseFirestore
        .collection('reservations')
        .where('bookReservedId', isEqualTo: bookCod)
        .where('statusBook', isEqualTo: 'Solicitado')
        .where('reservationList', arrayContains: usuario!.uid)
        .get()
        .then((value) async {
      firebaseFirestore.collection('reservations').doc(value.docs.first.id).update({"statusBook": "Cancelada"});
      await createLog(
        time: DateTime.now().millisecondsSinceEpoch.toString(),
        action: "Cancelamento", // de reserva
        userId: await getRegistrationById(usuario!.uid), //TODO Atualizar depois aqui tambem,
        codBook: bookCod,
      );
    });
  }

  doReservation(dynamic book) async {
    // Por enquanto não deixar um tempo limite para pegar depois de reservar
    DateFormat date = DateFormat('dd/MM/yyyy HH:mm');
    await firebaseFirestore.collection("reservations").add(ReservationModel(
            bookReservedId: book['codigo'],
            reservationDate: date.format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch)),
            reservationList: [usuario!.uid],
            statusBook: 'Solicitado' // bookBorrowed: await getIdByCod(bookCod),
            )
        .toMap());
    await createLog(
      time: DateTime.now().millisecondsSinceEpoch.toString(),
      action: "Reserva", // de reserva
      userId: await getRegistrationById(usuario!.uid), //TODO Atualizar depois aqui tambem,
      codBook: book['codigo'],
    );
  }

  isReservationUser(String bookCod) async {
    return await firebaseFirestore
        .collection('reservations')
        .where('bookReservedId', isEqualTo: bookCod)
        .where('statusBook', isEqualTo: 'Solicitado')
        .where('reservationList', arrayContains: usuario!.uid)
        .get()
        .then((value) async {
      return (value.docs.isEmpty) ? false : true;
    });
  }

  hasReservation(String bookCod) async {
    return await firebaseFirestore
        .collection('reservations')
        .where('bookReservedId', isEqualTo: bookCod)
        .where('statusBook', isEqualTo: 'Solicitado')
        .get()
        .then((value) async {
      // print(value.docs.first.id);
      return (value.docs.isEmpty) ? false : true;
    });
  }

  Future<bool> hasRequest(String bookCod) async {
    // Por enquanto devolver um Bool dizendo se tem o alguma solicitação sua lá
    return await firebaseFirestore
        .collection('emprestimo')
        .where('bookBorrowedId', isEqualTo: await getIdByCod(bookCod))
        .where('userLoan', isEqualTo: usuario!.uid)
        .where('status', isEqualTo: 'Solicitado')
        .get()
        .then((value) async {
      // print(value.docs.first.id);
      return (value.docs.isEmpty) ? false : true;
    });
  }

  sendBorrowRequest(String bookCod) async {
    DateFormat date = DateFormat('dd/MM/yyyy HH:mm');
    await firebaseFirestore.collection("emprestimo").add(LoanModel(
          bookBorrowed: await getIdByCod(bookCod),
          loanDate: date.format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch)),
          renovations: 3,
          returnDate: null,
          status: "Solicitado",
          userAllowing: null,
          userLoan: usuario!.uid,
        ).toMap());
  }

  confirmReturn(Map book) async {
    //Atualizar userloan do livro e datadisponibilidade = null
    //Atualizar loan do usuário
    //Atualizar registro do Empréstimo (Usar o id do livro + data de returno);

    await firebaseFirestore.collection('book').where('codigo', isEqualTo: book['codigo']).get().then((value) async {
      // TODO Colocar o código como id do livro
      await firebaseFirestore
          .collection('emprestimo')
          .where('bookBorrowed', isEqualTo: value.docs.first.id)
          .where('returnDate', isEqualTo: book['dataDisponibilidade'])
          .get()
          .then((value) async {
        await firebaseFirestore.collection("emprestimo").doc(value.docs.first.id).update({"status": 'Devolvido'});
      });
      await firebaseFirestore.collection("book").doc(value.docs.first.id).update({"userloan": null, "dataDisponibilidade": null});
    });
    await firebaseFirestore.collection('user').where('uId', isEqualTo: usuario!.uid).get().then((value) async {
      List userloans = value.docs.first.data()['userLoans'];
      List userloansNew = json.decode(json.encode(userloans));
      if (userloans.length > 1) {
        for (var loan in userloans) {
          if (loan['loan']['codBook'] == book['codigo']) {
            userloansNew.removeAt(userloans.indexOf(loan));
          }
        }
      } else {
        if (userloans[0]['loan']['codBook'] == book['codigo']) {
          userloansNew.removeAt(0);
        }
      }

      await firebaseFirestore.collection("user").doc(usuario!.uid).update({"userLoans": userloansNew});
      await createLog(
        time: DateTime.now().millisecondsSinceEpoch.toString(),
        action: "Devolução",
        userAdmId: usuario!.uid,
        userId: await getRegistrationById(value.docs.first.id), //TODO Atualizar depois aqui tambem,
        codBook: book['codigo'],
      );
    });
    Fluttertoast.showToast(msg: 'Obra devolvida');
  }

  Future<String> getRegistrationById(String userId) async {
    return await firebaseFirestore.collection('user').doc(userId).get().then((value) {
      return value.data()?['matriculaSIAPE'];
    });
  }

  Future<String> getCodById(String bookId) async {
    return await firebaseFirestore.collection('book').doc(bookId).get().then((value) {
      return value.data()?['codigo'];
    });
  }

  getIdByCod(String bookCod) async {
    return await firebaseFirestore.collection('book').where('codigo', isEqualTo: bookCod).get().then((value) {
      return value.docs.first.id;
    });
  }

  registerLoan(String userRegistration, String bookCod, String dataDevolucao) async {
    // Realizar a Efetuação do empréstimo
    // Usuário :
    //    Colocar map loan com infomrações no UserLoans (Com a referencia de quem permitiu esse empréstimo)                       V
    //    Referenciar esse usuário no livro (Id provavelmente) e mudar a data de Disponibilidade
    //    Colocar um novo LoanModel no database
    DateFormat date = DateFormat('dd/MM/yyyy HH:mm');

    await firebaseFirestore.collection('user').where('matriculaSIAPE', isEqualTo: userRegistration).get().then(
      (value) async {
        if (value.docs.first.id == usuario!.uid) {
          Fluttertoast.showToast(msg: 'Não pode emprestar para sí mesmo');
        } else {
          Map loan = {
            'loan': {
              'codBook': bookCod,
              'dataDevolucao': dataDevolucao,
              'renovacoes': 3,
              'status': 'Em dia',
              'admAllowing': usuario!.uid,
            }
          };
          List updatedUserLoans = value.docs.first.data()['userLoans'];
          updatedUserLoans.add(loan);
          await firebaseFirestore.collection("user").doc(value.docs.first.id).update({"userLoans": updatedUserLoans});
          String id = await getIdByCod(bookCod);
          await firebaseFirestore
              .collection("book")
              .doc(id)
              .update({"userloan": value.docs.first.id, "dataDisponibilidade": dataDevolucao});
          Fluttertoast.showToast(msg: 'Empréstimo realizado');
          // Fazer uma query por um request solicitado já existente substituir se não :
          await firebaseFirestore
              .collection('emprestimo')
              .where('bookBorrowed', isEqualTo: id)
              .where('userLoan', isEqualTo: await getIdByRegistration(userRegistration))
              .where('status', isEqualTo: 'Solicitado')
              .get()
              .then((value) async {
            if (value.docs.isEmpty) {
              await firebaseFirestore.collection("emprestimo").add(LoanModel(
                    // Checar se já existe algum request se tiver atualizar ele se não criar aqui mesmo
                    bookBorrowed: id,
                    loanDate: date.format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch)),
                    renovations: 3,
                    returnDate: dataDevolucao,
                    status: "Em dia",
                    userAllowing: usuario!.uid,
                    userLoan: await getIdByRegistration(userRegistration),
                  ).toMap()); // Teoricamente isso é pra facilitar as atividades
            } else {
              await firebaseFirestore.collection("emprestimo").doc(value.docs.first.id).update({
                "loanDate": date.format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch)),
                "returnDate": dataDevolucao,
                "userAllowing": usuario!.uid,
                "status": 'Em dia',
              });
            }
          });
          await createLog(
            time: DateTime.now().millisecondsSinceEpoch.toString(),
            action: "Empréstimo",
            userAdmId: usuario!.uid,
            userId: await getRegistrationById(value.docs.first.id), //TODO Atualizar depois aqui tambem,
            codBook: bookCod,
          );
        }
      },
    ).catchError(
      (e) {
        Fluttertoast.showToast(msg: e.toString());
        return null;
      },
    );
  }

  getIdByRegistration(String registration) async {
    await firebaseFirestore.collection('user').where('matriculaSIAPE', isEqualTo: registration).get().then((value) {
      return value.docs.first.id;
    });
  }

  Future<String?> getEmailByRegistration(String registration) async {
    String? resp;
    await firebaseFirestore.collection('user').where('matriculaSIAPE', isEqualTo: registration).get().then(
      (value) {
        if (value.docs.isEmpty) {
          Fluttertoast.showToast(msg: 'Matrícula não encontrada');
          return null;
        }
        for (var docSnapshot in value.docs) {
          if (!docSnapshot.data()['validated']) {
            return 'Matrícula não validada';
          }
          resp = docSnapshot.data()['email'];
        }
      },
    ).catchError(
      (e) {
        Fluttertoast.showToast(msg: e!.message);
        return null;
      },
    );
    return resp;
  }

  Future<Map<String, dynamic>> getBookData(String code) async {
    Map<String, dynamic> resp = {
      "nome": 'Null',
      "autor": 'Null',
      "edicao": 'Null',
      "tipo": 'Null',
    };
    await firebaseFirestore.collection('book').where('codigo', isEqualTo: code).where('isDeleted', isEqualTo: false).get().then(
      (value) {
        if (value.docs.isEmpty) {
          Fluttertoast.showToast(msg: 'Livro não encontrada');
          return null;
        } else if (!(value.docs.first.data()['userloan'].toString() == 'null')) {
          Fluttertoast.showToast(msg: 'Obra indisponível');
          return null;
        }
        for (var docSnapshot in value.docs) {
          resp = {
            "nome": docSnapshot.data()['nome'],
            "autor": docSnapshot.data()['autor'],
            "edicao": docSnapshot.data()['edicao'].toString(),
            "tipo": docSnapshot.data()['tipo'],
          };
        }
      },
    ).catchError(
      (e) {
        Fluttertoast.showToast(msg: e!.message);
        return null;
      },
    );
    return resp;
  }

  updateValidate(Map<String, dynamic> rV, String readerRegistration, String? userRegistration) async {
    // TODO Fiz uma solução não legal, atualizar quando tiver tempo
    DateFormat date = DateFormat('dd/MM/yyyy HH:mm');

    await firebaseFirestore
        .collection('validation')
        .where('userReaderId', isEqualTo: readerRegistration)
        .get()
        .then((value) async {
      await firebaseFirestore.collection("validation").doc(value.docs.first.id).update(
        {
          "status": true,
          "userAllowingId": userRegistration,
          "dateValidation": date.format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch))
        },
      );
    });
    await createLog(
      time: DateTime.now().millisecondsSinceEpoch.toString(),
      action: "Validação",
      userAdmId: userRegistration,
      userId: readerRegistration,
    );
  }

  confirmValidation(String registration, Map<String, dynamic> requestValidate) async {
    await firebaseFirestore.collection('user').where('matriculaSIAPE', isEqualTo: registration).get().then(
      (value) async {
        if (value.docs.isEmpty) {
          Fluttertoast.showToast(msg: 'Matrícula não encontrada');
          return false;
        }
        for (var docSnapshot in value.docs) {
          var usermap = docSnapshot.data();
          usermap['validated'] = true;
          firebaseFirestore.collection("user").doc(usermap['uId']).update({"validated": true});
        }
        Fluttertoast.showToast(msg: 'Validado com Sucesso');
      },
    ).catchError(
      (e) {
        Fluttertoast.showToast(msg: e!.message);
        return false;
      },
    );
    updateValidate(requestValidate, registration, usuario?.uid);
  }

  sendValidationRequest(String registration) async {
    DateFormat date = DateFormat('dd/MM/yyyy HH:mm');
    ValidationModel validationRequest = ValidationModel(
        dateRequest: date.format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch)),
        dateValidation: date.format(DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch)),
        status: false,
        userAllowingId: null,
        userReaderId: registration);
    await firebaseFirestore.collection("validation").add(validationRequest.toMap());
  }

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
          if (docSnapshot.data()['validated']) {
            String email = docSnapshot.data()['email'];
            succesSignIn = await signIn(
              context,
              email,
              password,
              docSnapshot.data()['typeAdmin'],
            );
          } else {
            Fluttertoast.showToast(msg: 'Matrícula não validada');
          }

          // nickname = docSnapshot.data()['nickname']; // Provavelmente não é a melhor prática
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
      validated: false,
      userLoans: [],
    );

    // * Writing all the values

    await firebaseFirestore.collection("user").doc(user.uid).set(userModel.toMap());
    Fluttertoast.showToast(msg: "Conta criada com sucesso");
    sendValidationRequest(texMatriculaController.text);

    // Não sei corrigir
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const RegisterValidationHelpPageWidget()),
      (route) => false,
    );
  }

  Future<bool> checkIfExist(String nome, String autor, String edicao) async {
    // TODO: Fazer uma função de retorno do _value_
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
        dataDisponibilidade: null,
        isDeleted: false,
        userloan: null,
        admRecorder: usuario?.uid,
      );
      await createLog(
        time: DateTime.now().millisecondsSinceEpoch.toString(),
        action: "Cadastro",
        userAdmId: usuario!.uid,
        codBook: 'EMP-123', //TODO atualizar com o sistema de codigo automático
      );
      (!isUpdating) ? await firebaseFirestore.collection("book").add(bookModel.toMap()) : null;
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
          (value) async {
            firebaseFirestore.collection("book").doc(value.docs.first.id).set(bookModel.toMap());
            await createLog(
              time: DateTime.now().millisecondsSinceEpoch.toString(),
              action: "Edição",
              userAdmId: usuario!.uid,
              codBook: value.docs.first.id, //TODO Colocar o getCodByID
            );
          },
        );
      }
    } else {
      Fluttertoast.showToast(msg: 'Livro já Cadastrado');
    }
  }

  deleteBook(
    // reduzir pedindo o id pra fazer a mudança
    Map<String, dynamic> obra,
  ) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    obra['isDeleted'] = true;
    await firebaseFirestore
        .collection('book')
        .where('nome', isEqualTo: obra['nome'])
        .where('autor', isEqualTo: obra['autor'])
        .where('edicao', isEqualTo: int.tryParse(obra['nome']))
        .get()
        .then(
      (value) async {
        if (value.docs.isEmpty) {
          Fluttertoast.showToast(msg: "Obra não existe no sistema");
        } else {
          await firebaseFirestore.collection("book").doc(value.docs.first.id).set(obra);
          Fluttertoast.showToast(msg: "Obra Deleta do sistema!");
          await createLog(
            time: DateTime.now().millisecondsSinceEpoch.toString(),
            action: "Remoção",
            userAdmId: usuario!.uid,
            codBook: value.docs.first.id, //TODO Colocar o getCodByID
          );
        }
      },
    );
  }
}
