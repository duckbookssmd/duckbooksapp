class UserModel {
  late String? uId;
  late String? userMatricula = "666666";
  late String? userEmail = "email@dominio.com";
  late String? userSenha = "pass";
  late String? userConfSenha = "pass";
  late bool? isLogged = false;

  UserModel({
    String? uid,
    String? matricula,
    String? email,
    String? senha,
    String? confSenha,
    bool? logged,
  }) {
    uId = uid;
    userMatricula = matricula;
    userEmail = email;
    userSenha = senha;
    userConfSenha = confSenha;
    isLogged = logged;
  }

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      matricula: map['userMatricula'],
      email: map['userEmail'],
      senha: map['userSenha'],
      confSenha: map['userConfSenha'],
      logged: map['isLogged'],
    );
  }

  // * Sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uId,
      'userMatricula': matriculaSIAPE,
      'userEmail': email,
      'userSenha': pass,
      'userConfSenha': cfmPass,
      'isLogged': isLogged,
    };
  }
}
