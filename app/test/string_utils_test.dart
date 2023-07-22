import 'package:app/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('truncateWithEllipsis tests', () {
    test('truncate - success', () async {
      String bookName = 'Influencer: construindo sua marca pessoal na era das mídias sociais';
      int cut = 30;
      
      expect(truncateWithEllipsis(cut, bookName), 'Influencer: construindo sua ma...');
    });
    test('Dont need to truncate - success', () async {
      String bookName = 'My Pinterest';
      int cut = 30;
      
      expect(truncateWithEllipsis(cut, bookName), 'My Pinterest');
    });
  });

  group('removeAccents tests', () {
    test('Removing Accents 01- success', () async {
      String str = 'àáâãäåòóôõöøèéêëðçìíîïùúûüñšÿýž';
      
      expect(removeAccents(str), 'aaaaaaooooooeeeeeciiiiuuuunsyyz');
    });

    test('Removing Accents 02- success', () async {
      String str = 'éssa frâse está limpa.';
      
      expect(removeAccents(str), 'essa frase esta limpa.');
    });
  });
}
