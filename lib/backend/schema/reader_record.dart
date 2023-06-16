import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReaderRecord extends FirestoreRecord {
  ReaderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "pass" field.
  String? _pass;
  String get pass => _pass ?? '';
  bool hasPass() => _pass != null;

  // "cfmPass" field.
  String? _cfmPass;
  String get cfmPass => _cfmPass ?? '';
  bool hasCfmPass() => _cfmPass != null;

  // "matriculaSIAPE" field.
  String? _matriculaSIAPE;
  String get matriculaSIAPE => _matriculaSIAPE ?? '';
  bool hasMatriculaSIAPE() => _matriculaSIAPE != null;

  // "isLogged" field.
  bool? _isLogged;
  bool get isLogged => _isLogged ?? false;
  bool hasIsLogged() => _isLogged != null;

  // "emprestimos" field.
  List<DocumentReference>? _emprestimos;
  List<DocumentReference> get emprestimos => _emprestimos ?? const [];
  bool hasEmprestimos() => _emprestimos != null;

  // "reservas" field.
  List<DocumentReference>? _reservas;
  List<DocumentReference> get reservas => _reservas ?? const [];
  bool hasReservas() => _reservas != null;

  // "favorites" field.
  List<DocumentReference>? _favorites;
  List<DocumentReference> get favorites => _favorites ?? const [];
  bool hasFavorites() => _favorites != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _pass = snapshotData['pass'] as String?;
    _cfmPass = snapshotData['cfmPass'] as String?;
    _matriculaSIAPE = snapshotData['matriculaSIAPE'] as String?;
    _isLogged = snapshotData['isLogged'] as bool?;
    _emprestimos = getDataList(snapshotData['emprestimos']);
    _reservas = getDataList(snapshotData['reservas']);
    _favorites = getDataList(snapshotData['favorites']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('reader')
          : FirebaseFirestore.instance.collectionGroup('reader');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('reader').doc();

  static Stream<ReaderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReaderRecord.fromSnapshot(s));

  static Future<ReaderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReaderRecord.fromSnapshot(s));

  static ReaderRecord fromSnapshot(DocumentSnapshot snapshot) => ReaderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReaderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReaderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReaderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReaderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReaderRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  DateTime? editedTime,
  String? pass,
  String? cfmPass,
  String? matriculaSIAPE,
  bool? isLogged,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'edited_time': editedTime,
      'pass': pass,
      'cfmPass': cfmPass,
      'matriculaSIAPE': matriculaSIAPE,
      'isLogged': isLogged,
    }.withoutNulls,
  );

  return firestoreData;
}
