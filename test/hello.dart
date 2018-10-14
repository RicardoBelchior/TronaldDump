import 'dart:async';

void main() async {
  print("hi there");

  var clapping = '\u{1f44f}';
  print(clapping);
  print(clapping.codeUnits);
  print(clapping.runes.toList());

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));

  Stream<int> stream = Stream.fromIterable([1, 2, 3, 4, 5]);

  var fold = stream.fold(0, (previous, element) {
    return previous + element;
  }).asStream();

//  await for (var num in fold) {
//    print("number: $num");
//  }

  fold.listen((data) {
    print("data: $data");
  });
}
