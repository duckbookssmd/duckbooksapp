class BookModel {
  late String? nome;
  late String? autor;
  late String? editora;
  late int? ano;
  late int? edicao;
  late String? tipo;
  late String? foto = "";
  late String? genero = "";
  late String dataCadastro;
  late bool isDeleted;

  BookModel({
    required this.nome,
    required this.autor,
    required this.editora,
    required this.ano,
    required this.edicao,
    required this.tipo,
    required this.foto,
    required this.genero,
    required this.dataCadastro,
    required this.isDeleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'autor': autor,
      'ano': ano,
      'edicao': edicao,
      'tipo': tipo,
      'foto': foto,
      'genero': genero,
      'dataCadastro': dataCadastro,
      'editora': editora,
      'isDeleted': isDeleted
    };
  }
}
