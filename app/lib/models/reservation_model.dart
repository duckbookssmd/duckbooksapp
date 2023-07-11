class ReservationModel {
  dynamic bookReservedId;
  List reservationList; // Vai ter o id das pesoas que pedirem reservas
  String statusBook;
  dynamic reservationDate;

  ReservationModel({
    required this.bookReservedId,
    required this.reservationList,
    required this.statusBook,
    required this.reservationDate,
  });

  ReservationModel copyWith({
    dynamic bookReservedId,
    List? reservationList,
    String? statusBook,
    dynamic reservationDate,
  }) {
    return ReservationModel(
      bookReservedId: bookReservedId ?? this.bookReservedId,
      reservationList: reservationList ?? this.reservationList,
      statusBook: statusBook ?? this.statusBook,
      reservationDate: reservationDate ?? this.reservationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookReservedId': bookReservedId,
      'reservationList': reservationList,
      'statusBook': statusBook,
      'reservationDate': reservationDate,
    };
  }

  @override
  String toString() {
    return 'ReservationModel(bookReservedId: $bookReservedId, reservationList: $reservationList, statusBook: $statusBook, reservationDate: $reservationDate)';
  }
}
