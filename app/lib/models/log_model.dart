class LogModel {
  /// Tempo de criação do Log em milliseccondPerEpcos
  String time;
  /// Matrícula do usuário que realizou a açao.
  String userId;
  /// Matrícula do Admistrador que permitiu a açao, caso exista.
  String? userAdmId;
  String action;
  /// Código do livro
  String? codBook;
  LogModel({
    required this.time,
    required this.userId,
    this.userAdmId,
    required this.action,
    this.codBook,
  });

  LogModel copyWith({
    String? time,
    String? userId,
    String? userAdmId,
    String? action,
    String? codBook,
  }) {
    return LogModel(
      time: time ?? this.time,
      userId: userId ?? this.userId,
      userAdmId: userAdmId ?? this.userAdmId,
      action: action ?? this.action,
      codBook: codBook ?? this.codBook,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'userId': userId,
      'userAdmId': userAdmId,
      'action': action,
      'codBook': codBook,
    };
  }

  factory LogModel.fromMap(Map<String, dynamic> map) {
    return LogModel(
      time: map['time'] as String,
      userId: map['userId'] as String,
      userAdmId: map['userAdmId'] != null ? map['userAdmId'] as String : null,
      action: map['action'] as String,
      codBook: map['codBook'] != null ? map['codBook'] as String : null,
    );
  }

  @override
  String toString() {
    return 'LogModel(time: $time, userId: $userId, userAdmId: $userAdmId, action: $action, codBook: $codBook)';
  } 
}
