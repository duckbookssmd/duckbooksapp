import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ObraRecord extends FirestoreRecord {
  ObraRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "autor" field.
  String? _autor;
  String get autor => _autor ?? '';
  bool hasAutor() => _autor != null;

  // "ano" field.
  String? _ano;
  String get ano => _ano ?? '';
  bool hasAno() => _ano != null;

  // "edicao" field.
  String? _edicao;
  String get edicao => _edicao ?? '';
  bool hasEdicao() => _edicao != null;

  // "genero" field.
  List<String>? _genero;
  List<String> get genero => _genero ?? const [];
  bool hasGenero() => _genero != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _autor = snapshotData['autor'] as String?;
    _ano = snapshotData['ano'] as String?;
    _edicao = snapshotData['edicao'] as String?;
    _genero = getDataList(snapshotData['genero']);
    _tipo = snapshotData['tipo'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('obra');

  static Stream<ObraRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ObraRecord.fromSnapshot(s));

  static Future<ObraRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ObraRecord.fromSnapshot(s));

  static ObraRecord fromSnapshot(DocumentSnapshot snapshot) => ObraRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ObraRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ObraRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ObraRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ObraRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createObraRecordData({
  String? nome,
  String? autor,
  String? ano,
  String? edicao,
  String? tipo,
  DateTime? createdTime,
  DateTime? editedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'autor': autor,
      'ano': ano,
      'edicao': edicao,
      'tipo': tipo,
      'created_time': createdTime,
      'edited_time': editedTime,
    }.withoutNulls,
  );

  return firestoreData;
}
