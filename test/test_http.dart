import 'dart:async';
import 'package:tronald_dump/data/api_remote.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchPost() {
  //return http.get('https://jsonplaceholder.typicode.com/posts/1');
  return http.get('https://api.tronalddump.io/search/quote?query=obama');
}

void main() async {
  print("start");

  final repo = TronaldRepositoryRemote();

  await repo.random().then(print);
  await repo.getTags().then(print);
  await repo.getTag("Ivanka Trump").then(print);
  await repo.getQuote("Js5AQrOsQxmjLrq5F_Os2w").then(print);
  await repo.search("obama").then(print);

  fetchPost()
      .then((result) => print(result.statusCode))
      .whenComplete(() => print("completed"));

  var result = await fetchPost();
  print(result.statusCode);
  print(result.body);

  await Future.delayed(Duration(seconds: 5));
  print("finish");
}
