class ValidationModel {
  dynamic dateRequest;
  dynamic dateValidation;
  bool status;
  String? userAllwingId;
  String? userReaderId;
  ValidationModel({
    required this.dateRequest,
    required this.dateValidation,
    required this.status,
    required this.userAllwingId,
    this.userReaderId,
  });

  ValidationModel copyWith({
    dynamic dateRequest,
    dynamic dateValidation,
    bool? status,
    String? userAllwingId,
    String? userReaderId,
  }) {
    return ValidationModel(
      dateRequest: dateRequest ?? this.dateRequest,
      dateValidation: dateValidation ?? this.dateValidation,
      status: status ?? this.status,
      userAllwingId: userAllwingId ?? this.userAllwingId,
      userReaderId: userReaderId ?? this.userReaderId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateRequest': dateRequest,
      'dateValidation': dateValidation,
      'status': status,
      'userAllwingId': userAllwingId,
      'userReaderId': userReaderId,
    };
  }

  factory ValidationModel.fromMap(Map<String, dynamic> map) {
    return ValidationModel(
      dateRequest: map['dateRequest'] as dynamic,
      dateValidation: map['dateValidation'] as dynamic,
      status: map['status'] as bool,
      userAllwingId: map['userAllwingId'] != null ? map['userAllwingId'] as String : null,
      userReaderId: map['userReaderId'] != null ? map['userReaderId'] as String : null,
    );
  }

  @override
  String toString() {
    return 'ValidationModel(dateRequest: $dateRequest, dateValidation: $dateValidation, status: $status, userAllwingId: $userAllwingId, userReaderId: $userReaderId)';
  }

}
