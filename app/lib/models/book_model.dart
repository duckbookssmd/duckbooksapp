class BookModel {
  late String? nome;
  late String? autor;
  late String? editora;
  late int? ano;
  late int? edicao;
  /// Tipo de mídia da obra, como livro, DVD, Mangá e etc...
  late String? tipoMidia;
  /// URl da imagem
  late String? foto = "";
  late String? genero = "";
  late String dataCadastro;
  late bool isDeleted;
  late String? dataDisponibilidade;
  late dynamic userloan;
  late dynamic admRecorder;
  late String codigo;
  late String isbn;

  BookModel({
    required this.nome,
    required this.autor,
    required this.editora,
    required this.ano,
    required this.edicao,
    required this.tipoMidia,
    required this.foto,
    required this.genero,
    required this.dataCadastro,
    required this.isDeleted,
    required this.dataDisponibilidade,
    required this.userloan,
    this.admRecorder,
    required this.codigo,
    required this.isbn,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'autor': autor,
      'ano': ano,
      'edicao': edicao,
      'tipo': tipoMidia,
      'foto': foto,
      'genero': genero,
      'dataCadastro': dataCadastro,
      'editora': editora,
      'isDeleted': isDeleted,
      'dataDisponibilidade': dataDisponibilidade,
      'userloan': userloan,
      'admRecorder': admRecorder,
      'codigo': codigo,
      'isbn': isbn,
    };
  }
}
