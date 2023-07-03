// ignore_for_file: public_member_api_docs, sort_constructors_first
class ValidationModel {
  dynamic dateRequest;
  dynamic dateValidation;
  bool status;
  String userAllwingId;
  String userReader;
  ValidationModel({
    required this.dateRequest,
    required this.dateValidation,
    required this.status,
    required this.userAllwingId,
    required this.userReader,
  });

  ValidationModel copyWith({
    dynamic dateRequest,
    dynamic dateValidation,
    bool? status,
    String? userAllwingId,
    String? userReader,
  }) {
    return ValidationModel(
      dateRequest: dateRequest ?? this.dateRequest,
      dateValidation: dateValidation ?? this.dateValidation,
      status: status ?? this.status,
      userAllwingId: userAllwingId ?? this.userAllwingId,
      userReader: userReader ?? this.userReader,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateRequest': dateRequest,
      'dateValidation': dateValidation,
      'status': status,
      'userAllwingId': userAllwingId,
      'userReader': userReader,
    };
  }

  factory ValidationModel.fromMap(Map<String, dynamic> map) {
    return ValidationModel(
      dateRequest: map['dateRequest'] as dynamic,
      dateValidation: map['dateValidation'] as dynamic,
      status: map['status'] as bool,
      userAllwingId: map['userAllwingId'] as String,
      userReader: map['userReader'] as String,
    );
  }

  @override
  String toString() {
    return 'ValidationModel(dateRequest: $dateRequest, dateValidation: $dateValidation, status: $status, userAllwingId: $userAllwingId, userReader: $userReader)';
  }

}
