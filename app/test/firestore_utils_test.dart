import 'package:app/utils/firestore_utils.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

late FakeFirebaseFirestore instance;
late List<Map<String, dynamic>> bookList;
late String uid;

main() {
  setUpAll(() async {
    uid = 'MmXsNm8SMWXzwvcuNBhHb07NmcE2';
    instance = FakeFirebaseFirestore();
    await instance.collection('book').doc('DYRTbErAZjAbcUcU6FiX').set({
      'tipo': 'Livro',
      'codigo': 'CDG-004',
      'ano': 2019,
      'isbn': 9788583394969,
      'nome': '#Influencer',
      'edicao': 1,
      'editora': 'AlfaCon',
      'autor': 'Brittany Hennessy',
      'dataDisponibilidade': '31/07/2023 18:38',
      'userloan': 'MmXsNm8SMWXzwvcuNBhHb07NmcE2',
      'foto': 'http://books.google.com/books/content?id=4LYdzwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
      'isDeleted': false,
      'genero': 'Cultura digital',
      'admRecorder': 'JJrV1ZLsdEUOQYX7IngEgKw5Vmq2',
      'dataCadastro': '13/07/2023 17:48',
    });
    await instance.collection('book').add({
      'tipo': 'Livro',
      'codigo': 'CDG-001',
      'ano': 2014,
      'isbn': 9788583394969,
      'nome': 'Como fazer testes com Flutter',
      'edicao': 2,
      'editora': 'DuckBooks',
      'autor': 'Domingues. D. André',
      'dataDisponibilidade': '12/07/2023 18:38',
      'userloan': null,
      'foto': 'http://books.google.com/books/content?id=4LYdzwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
      'isDeleted': false,
      'genero': 'Cultura digital',
      'admRecorder': 'JJrV1ZLsdEUOQYX7IngEgKw5Vmq2',
      'dataCadastro': '13/07/2023 17:48',
    });
    await instance.collection('book').add({
      'tipo': 'Livro',
      'codigo': 'EMP-001',
      'ano': 2004,
      'isbn': 9788583394969,
      'nome': 'Livro deletado',
      'edicao': 2,
      'editora': 'DuckBooks',
      'autor': 'Domingues. D. André',
      'dataDisponibilidade': '12/07/2023 18:38',
      'userloan': 'MmXsNm8SMWXzwvcuNBhHb07NmcE2',
      'foto': 'http://books.google.com/books/content?id=4LYdzwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
      'isDeleted': true,
      'genero': 'Empreendorismo',
      'admRecorder': 'JJrV1ZLsdEUOQYX7IngEgKw5Vmq2',
      'dataCadastro': '13/07/2023 17:48',
    });
    await instance.collection('book').add({
      'tipo': 'Livro',
      'codigo': 'CDG-002',
      'ano': 2014,
      'isbn': 9788583394969,
      'nome': 'Introdução à programação orientada a objetos usando java',
      'edicao': 2,
      'editora': 'DuckBooks',
      'autor': 'Domingues. D. André',
      'dataDisponibilidade': '12/07/2023 18:38',
      'userloan': null,
      'foto': 'http://books.google.com/books/content?id=4LYdzwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
      'isDeleted': false,
      'genero': 'Cultura digital',
      'admRecorder': 'JJrV1ZLsdEUOQYX7IngEgKw5Vmq2',
      'dataCadastro': '13/07/2023 17:48',
    });
    await instance.collection('book').add({
      'tipo': 'Livro',
      'codigo': 'EMP-001',
      'ano': 2014,
      'isbn': 9788583394969,
      'nome': 'Introdução à programação orientada a objetos usando java',
      'edicao': 2,
      'editora': 'DuckBooks',
      'autor': 'Domingues. D. André',
      'dataDisponibilidade': '12/07/2023 18:38',
      'userloan': null,
      'foto': 'http://books.google.com/books/content?id=4LYdzwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
      'isDeleted': false,
      'genero': 'Empreendorismo',
      'admRecorder': 'JJrV1ZLsdEUOQYX7IngEgKw5Vmq2',
      'dataCadastro': '13/07/2023 17:48',
    });
    await instance.collection('book').add({
      'tipo': 'Livro',
      'codigo': 'EMP-003',
      'ano': 2014,
      'isbn': 9788583394969,
      'nome': 'Steve Jobs',
      'edicao': 2,
      'editora': 'DuckBooks',
      'autor': 'Domingues. D. André',
      'dataDisponibilidade': '12/07/2023 18:38',
      'userloan': null,
      'foto': 'http://books.google.com/books/content?id=4LYdzwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
      'isDeleted': false,
      'genero': 'Empreendorismo',
      'admRecorder': 'JJrV1ZLsdEUOQYX7IngEgKw5Vmq2',
      'dataCadastro': '13/07/2023 17:48',
    });
    await instance.collection('emprestimo').add({
      'bookBorrowed': 'DYRTbErAZjAbcUcU6FiX',
      // 'loanDate': loanDate,
      'renovations': 3,
      'returnDate': '31/07/2023 18:38',
      'status': 'Em dia',
      // 'userAllowing': userAllowing,
      'userLoan': 'MmXsNm8SMWXzwvcuNBhHb07NmcE2',
    });

    bookList = await updateBookList(instance, true);
    // print(instance.dump());
  });

  group('updateBookListByLoan tests', () {
    test('Updating with Uid - Success', () async {
      List<Map<String, dynamic>> bookListFiltered = await updateBookListByLoan(uid, instance, true);
      expect(bookListFiltered.length, 1);
      expect(bookListFiltered[0]['renovacoes'], 3);
      expect(bookListFiltered[0]['dataDisponibilidade'], '31/07/2023 18:38');
      for (var book in bookListFiltered) {
        expect(book['isDeleted'], false);
      }
    });
  });

  group('updateBookListByGerne tests', () {
    test('Updating with Genre "Empreendorismo" - Success', () async {
      List<Map<String, dynamic>> bookListFiltered = await updateBookListByGerne('Empreendorismo', instance, true);
      expect(bookListFiltered.length, 2);
      for (var book in bookListFiltered) {
        expect(book['isDeleted'], false);
      }
    });

    test('Updating with Genre "Cultura digital" - Success', () async {
      List<Map<String, dynamic>> bookListFiltered = await updateBookListByGerne('Cultura digital', instance, true);
      expect(bookListFiltered.length, 3);
      for (var book in bookListFiltered) {
        expect(book['isDeleted'], false);
      }
    });
    test('Updating with Genre "Java" - Success', () async {
      List<Map<String, dynamic>> bookListFiltered = await updateBookListByGerne('Java', instance, true);
      expect(bookListFiltered.length, 0);
    });
  });

  group('updateBookList tests', () {
    test('Updating the book list - Success', () async {
      // List<Map<String, dynamic>> bookList = await updateBookList(instance);
      expect(bookList.length, 5);
    });

    test('Not deleted one in book list - Success', () async {
      // List<Map<String, dynamic>> bookList = await updateBookList(instance);
      for (var book in bookList) {
        expect(book['isDeleted'], false);
      }
    });
  });

  group('searchByName tests', () {
    test('Searching letter "s" - Success', () async {
      // List<Map<String, dynamic>> bookList = await updateBookList(instance);
      List<Map<String, dynamic>> searchResponse = await searchBooksByName('s', bookList);
      expect(searchResponse.length, 4);
    });

    test('Searching deleted one - failude', () async {
      // List<Map<String, dynamic>> bookList = await updateBookList(instance);
      List<Map<String, dynamic>> searchResponse = await searchBooksByName('deletado', bookList);
      expect(searchResponse.length, 0);
    });

    test('Searching "#Inf" - Success', () async {
      // List<Map<String, dynamic>> bookList = await updateBookList(instance);
      List<Map<String, dynamic>> searchResponse = await searchBooksByName('#Inf', bookList);
      expect(searchResponse.length, 1);
      expect(searchResponse[0]['nome'], equals('#Influencer'));
    });

    test('Searching accent - Success', () async {
      // List<Map<String, dynamic>> bookList = await updateBookList(instance);
      List<Map<String, dynamic>> searchResponse = await searchBooksByName('â', bookList);
      expect(searchResponse.length, 3);
    });
  });
}