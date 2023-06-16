import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminRecord extends FirestoreRecord {
  AdminRecord._(
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

  // "adminAccess" field.
  String? _adminAccess;
  String get adminAccess => _adminAccess ?? '';
  bool hasAdminAccess() => _adminAccess != null;

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
    _adminAccess = snapshotData['adminAccess'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('admin')
          : FirebaseFirestore.instance.collectionGroup('admin');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('admin').doc();

  static Stream<AdminRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminRecord.fromSnapshot(s));

  static Future<AdminRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminRecord.fromSnapshot(s));

  static AdminRecord fromSnapshot(DocumentSnapshot snapshot) => AdminRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  DateTime? editedTime,
  String? pass,
  String? cfmPass,
  String? matriculaSIAPE,
  bool? isLogged,
  String? adminAccess,
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
      'adminAccess': adminAccess,
    }.withoutNulls,
  );

  return firestoreData;
}
