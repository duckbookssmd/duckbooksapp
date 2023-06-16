import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservaRecord extends FirestoreRecord {
  ReservaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "disponibility" field.
  String? _disponibility;
  String get disponibility => _disponibility ?? '';
  bool hasDisponibility() => _disponibility != null;

  // "obra" field.
  DocumentReference? _obra;
  DocumentReference? get obra => _obra;
  bool hasObra() => _obra != null;

  // "reader" field.
  DocumentReference? _reader;
  DocumentReference? get reader => _reader;
  bool hasReader() => _reader != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _quantity = snapshotData['quantity'] as int?;
    _disponibility = snapshotData['disponibility'] as String?;
    _obra = snapshotData['obra'] as DocumentReference?;
    _reader = snapshotData['reader'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reserva');

  static Stream<ReservaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservaRecord.fromSnapshot(s));

  static Future<ReservaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservaRecord.fromSnapshot(s));

  static ReservaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservaRecordData({
  DateTime? createdAt,
  int? quantity,
  String? disponibility,
  DocumentReference? obra,
  DocumentReference? reader,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'quantity': quantity,
      'disponibility': disponibility,
      'obra': obra,
      'reader': reader,
    }.withoutNulls,
  );

  return firestoreData;
}
