class ValidationModel {
  dynamic dateRequest;
  dynamic dateValidation;
  bool status;
  String? userAllowingId;
  String? userReaderId;
  ValidationModel({
    required this.dateRequest,
    required this.dateValidation,
    required this.status,
    this.userAllowingId,
    this.userReaderId,
  });

  ValidationModel copyWith({
    dynamic dateRequest,
    dynamic dateValidation,
    bool? status,
    String? userAllowingId,
    String? userReaderId,
  }) {
    return ValidationModel(
      dateRequest: dateRequest ?? this.dateRequest,
      dateValidation: dateValidation ?? this.dateValidation,
      status: status ?? this.status,
      userAllowingId: userAllowingId ?? this.userAllowingId,
      userReaderId: userReaderId ?? this.userReaderId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateRequest': dateRequest,
      'dateValidation': dateValidation,
      'status': status,
      'userAllowingId': userAllowingId,
      'userReaderId': userReaderId,
    };
  }

  factory ValidationModel.fromMap(Map<String, dynamic> map) {
    return ValidationModel(
      dateRequest: map['dateRequest'] as dynamic,
      dateValidation: map['dateValidation'] as dynamic,
      status: map['status'] as bool,
      userAllowingId: map['userAllowingId'] != null ? map['userAllowingId'] as String : null,
      userReaderId: map['userReaderId'] != null ? map['userReaderId'] as String : null,
    );
  }

  @override
  String toString() {
    return 'ValidationModel(dateRequest: $dateRequest, dateValidation: $dateValidation, status: $status, userAllowingId: $userAllowingId, userReaderId: $userReaderId)';
  }

}
