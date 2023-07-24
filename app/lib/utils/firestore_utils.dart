/// Funçãos uteis para a manipulaçao dos dados presentes no FirebaseFirestore.

import 'package:cloud_firestore/cloud_firestore.dart';

import 'string_utils.dart';


/// Retorna uma [filttedList] com os livros que possuem a String [name] em seus nomes a partir de uma [lista] dada.
Future<List<Map<String, dynamic>>> searchBooksByName([String name = '', List<Map<String, dynamic>> lista = const []]) async {
  List<Map<String, dynamic>> filttedList = [];
  name = removeAccents(name.toLowerCase());

  for (Map<String, dynamic> livro in lista) {
    if (removeAccents(livro['nome'].toLowerCase()).contains(name)) {
      filttedList.add(livro);
    }
  }

  return filttedList;
}

// TODO: Criar funções separada dessa pesquisa para função como Loan Resevations ect...


/// Retorna uma lista atualizada de livros __não deletados__ presentes no [dataBase].
///
/// Em caso de uso para testes habilitar o [test].
Future<List<Map<String, dynamic>>> updateBookList([FirebaseFirestore? dataBase, bool test = false]) async {
  (test) ? null : dataBase = FirebaseFirestore.instance;

  /// Firebase instanse
  return await dataBase!.collection('book').where('nome', isNull: false).orderBy('nome', descending: false).get().then(
    (value) {
      List<Map<String, dynamic>> lista = [];
      for (var docSnapshot in value.docs) {
        if (!(docSnapshot.data()['isDeleted'].toString() == 'true')) {
          lista.add(docSnapshot.data());
        }
      }
      return lista;
    },
  );
}


/// Retorna uma lista atualizada de livros_não deletados presentes no [dataBase] e que possuam o [gerne].
///
/// Em caso de uso para testes habilitar o [test].
Future<List<Map<String, dynamic>>> updateBookListByGerne( String gerne, [FirebaseFirestore? dataBase, bool test = false]) async {
  (test) ? null : dataBase = FirebaseFirestore.instance;

  /// Firebase instanse
  return await dataBase!.collection('book').where('genero', isEqualTo: gerne).orderBy('nome', descending: false).get().then(
    (value) {
      List<Map<String, dynamic>> lista = [];
      for (var docSnapshot in value.docs) {
        if (!(docSnapshot.data()['isDeleted'].toString() == 'true')) {
          lista.add(docSnapshot.data());
        }
      }
      return lista;
    },
  );
}
