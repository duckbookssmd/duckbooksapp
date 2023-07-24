import 'package:app/utils/firestore_utils.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

late FakeFirebaseFirestore instance;

main() {
  setUpAll(() async {
    instance = FakeFirebaseFirestore();
    await instance.collection('book').add({
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
      'userloan': 'MmXsNm8SMWXzwvcuNBhHb07NmcE2',
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
    print(instance.dump());
  });

  group('firestore Utils  tests', () {
    test('Updating the book list - Success', () async {
      List<Map<String, dynamic>> bookList = await updateList(instance); 
      expect(bookList.length, 2);
    });

    test('Not deleted one in book list - Success', () async {
      List<Map<String, dynamic>> bookList = await updateList(instance);
      for (var book in bookList) {
        expect(book['isDeleted'], false);
      }
    });
  });
}
