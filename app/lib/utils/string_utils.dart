// Funções destinadas a manipulação de Strings.

/// Formata a String para um certo tamanho e acrescenta '...'.
///
/// Trunca a [myString] se o tamanho da String for maior ou igual ao [cutoff].
///
/// Eemplo:
/// ```dart
///   String bookName = 'Influencer: construindo sua marca pessoal na era das mídias sociais';
///   int cut = 30;
///   truncateWithEllipsis(cut, bookName), ); // 'Influencer: construindo sua ma...'
/// ```
String truncateWithEllipsis(int cutoff, String myString) {
  return (myString.length <= cutoff) ? myString : '${myString.substring(0, cutoff)}...';
}

/// Troca os caracteres com acento por seus respectivos pás sem acento
///
/// Recebe uma String [str] e a returna sem as vogais acentuadas presentes caso haja.
String removeAccents(String str) {
  var withAccent = 'àáâãäåòóôõöøèéêëðçìíîïùúûüñšÿýž';
  var withoutAccent = 'aaaaaaooooooeeeeeciiiiuuuunsyyz';

  for (int i = 0; i < withAccent.length; i++) {
    str = str.replaceAll(withAccent[i], withoutAccent[i]);
  }
  return str;
}