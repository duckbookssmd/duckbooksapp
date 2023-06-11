class BookModel {
  late String? nome;
  late String? autor;
  late int? ano;
  late int? edicao;
  late String? tipo;
  late String? foto = "";
  late String dataCadastro;

  BookModel({
    required this.nome,
    required this.autor,
    required this.ano,
    required this.edicao,
    required this.tipo,
    required this.foto,
    required this.dataCadastro,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'autor': autor,
      'ano': ano,
      'edicao': edicao,
      'tipo': tipo,
      'foto': foto,
      'dataCadastro': dataCadastro,
    };
  }
}
