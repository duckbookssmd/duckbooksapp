import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmprestimoRecord extends FirestoreRecord {
  EmprestimoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "loan_time" field.
  DateTime? _loanTime;
  DateTime? get loanTime => _loanTime;
  bool hasLoanTime() => _loanTime != null;

  // "devolution_time" field.
  DateTime? _devolutionTime;
  DateTime? get devolutionTime => _devolutionTime;
  bool hasDevolutionTime() => _devolutionTime != null;

  // "renovations" field.
  DateTime? _renovations;
  DateTime? get renovations => _renovations;
  bool hasRenovations() => _renovations != null;

  // "obra" field.
  DocumentReference? _obra;
  DocumentReference? get obra => _obra;
  bool hasObra() => _obra != null;

  // "reader" field.
  DocumentReference? _reader;
  DocumentReference? get reader => _reader;
  bool hasReader() => _reader != null;

  // "authorizer" field.
  DocumentReference? _authorizer;
  DocumentReference? get authorizer => _authorizer;
  bool hasAuthorizer() => _authorizer != null;

  void _initializeFields() {
    _loanTime = snapshotData['loan_time'] as DateTime?;
    _devolutionTime = snapshotData['devolution_time'] as DateTime?;
    _renovations = snapshotData['renovations'] as DateTime?;
    _obra = snapshotData['obra'] as DocumentReference?;
    _reader = snapshotData['reader'] as DocumentReference?;
    _authorizer = snapshotData['authorizer'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('emprestimo');

  static Stream<EmprestimoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmprestimoRecord.fromSnapshot(s));

  static Future<EmprestimoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmprestimoRecord.fromSnapshot(s));

  static EmprestimoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmprestimoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmprestimoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmprestimoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmprestimoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmprestimoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmprestimoRecordData({
  DateTime? loanTime,
  DateTime? devolutionTime,
  DateTime? renovations,
  DocumentReference? obra,
  DocumentReference? reader,
  DocumentReference? authorizer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'loan_time': loanTime,
      'devolution_time': devolutionTime,
      'renovations': renovations,
      'obra': obra,
      'reader': reader,
      'authorizer': authorizer,
    }.withoutNulls,
  );

  return firestoreData;
}
