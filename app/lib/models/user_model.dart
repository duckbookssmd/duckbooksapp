class UserModel {
  String? uId;
  String? matriculaSIAPE;
  String? email;
  String? pass;
  String? nickname;
  bool? typeAdmin = true; // Após finalizar a validação de usuários colocar pra false
  bool? validated = false; // Após finalizar a validação de usuários colocar pra false
  List<Map>? userLoans = [];
  List<Map>? userReservations = [];

  UserModel({
    required this.uId,
    required this.matriculaSIAPE,
    required this.email,
    required this.pass,
    this.nickname,
    this.typeAdmin,
    this.validated,
    this.userLoans,
    this.userReservations,
  });

  UserModel copyWith({
    String? uId,
    String? matriculaSIAPE,
    String? email,
    String? pass,
    String? nickname,
    bool? typeAdmin,
    bool? validated,
    List<Map>? userLoans,
    List<Map>? userReservations,
  }) {
    return UserModel(
      uId: uId ?? this.uId,
      matriculaSIAPE: matriculaSIAPE ?? this.matriculaSIAPE,
      email: email ?? this.email,
      pass: pass ?? this.pass,
      nickname: nickname ?? this.nickname,
      typeAdmin: typeAdmin ?? this.typeAdmin,
      validated: validated ?? this.validated,
      userLoans: userLoans ?? this.userLoans,
      userReservations: userReservations ?? this.userReservations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uId': uId,
      'matriculaSIAPE': matriculaSIAPE,
      'email': email,
      'pass': pass,
      'nickname': nickname,
      'typeAdmin': typeAdmin,
      'validated': validated,
      'userLoans': userLoans?.toList(),
      'userReservations': userReservations?.toList(),
    };
  }

  @override
  String toString() {
    return 'UserModel(uId: $uId, matriculaSIAPE: $matriculaSIAPE, email: $email, pass: $pass, nickname: $nickname, typeAdmin: $typeAdmin, validated: $validated, userLoans: $userLoans, userReservations: $userReservations)';
  }
}



// class UserModel {
//   late String? uId;
//   late String? userMatricula = "666666";
//   late String? userEmail = "email@dominio.com";
//   late String? userSenha = "pass";
//   late String? userConfSenha = "pass";
//   late bool? isLogged = false;
//   late bool? isadm = false;

//   UserModel({
//     String? uid,
//     String? matricula,
//     String? email,
//     String? senha,
//     String? confSenha,
//     bool? logged,
//     bool? isAdm,
//   }) {
//     uId = uid;
//     userMatricula = matricula;
//     userEmail = email;
//     userSenha = senha;
//     userConfSenha = confSenha;
//     isLogged = logged;
//     isadm = isAdm;
//   }

//   factory UserModel.fromMap(map) {
//     return UserModel(
//       uid: map['uid'],
//       matricula: map['userMatricula'],
//       email: map['userEmail'],
//       senha: map['userSenha'],
//       confSenha: map['userConfSenha'],
//       logged: map['isLogged'],
//       isAdm: map['isadm']
//     );
//   }

//   // * Sending data to server
//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uId,
//       'matriculaSIAPE': userMatricula,
//       'email': userEmail,
//       'pass': userSenha,
//       'cfmPass': userConfSenha,
//       'isLogged': isLogged,
//       'isAdm': isadm,
//     };
//   }
// }
