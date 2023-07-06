// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoanModel {
  String bookBorrowed;
  String loanDate;
  int renovations;
  String returnDate;
  String status;
  String userAllowing;
  String userLoan;
  
  LoanModel({
    required this.bookBorrowed,
    required this.loanDate,
    required this.renovations,
    required this.returnDate,
    required this.status,
    required this.userAllowing,
    required this.userLoan,
  });

  LoanModel copyWith({
    String? bookBorrowed,
    String? loanDate,
    int? renovations,
    String? returnDate,
    String? status,
    String? userAllowing,
    String? userLoan,
  }) {
    return LoanModel(
      bookBorrowed: bookBorrowed ?? this.bookBorrowed,
      loanDate: loanDate ?? this.loanDate,
      renovations: renovations ?? this.renovations,
      returnDate: returnDate ?? this.returnDate,
      status: status ?? this.status,
      userAllowing: userAllowing ?? this.userAllowing,
      userLoan: userLoan ?? this.userLoan,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookBorrowed': bookBorrowed,
      'loanDate': loanDate,
      'renovations': renovations,
      'returnDate': returnDate,
      'status': status,
      'userAllowing': userAllowing,
      'userLoan': userLoan,
    };
  }

  factory LoanModel.fromMap(Map<String, dynamic> map) {
    return LoanModel(
      bookBorrowed: map['bookBorrowed'] as String,
      loanDate: map['loanDate'] as String,
      renovations: map['renovations'] as int,
      returnDate: map['returnDate'] as String,
      status: map['status'] as String,
      userAllowing: map['userAllowing'] as String,
      userLoan: map['userLoan'] as String,
    );
  }

  @override
  String toString() {
    return 'LoanModel(bookBorrowed: $bookBorrowed, loanDate: $loanDate, renovations: $renovations, returnDate: $returnDate, status: $status, userAllowing: $userAllowing, userLoan: $userLoan)';
  }
}
