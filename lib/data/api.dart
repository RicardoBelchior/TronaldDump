import 'dart:async';
import 'package:tronald_dump/data/quote.dart';

abstract class TronaldRepository {
  Future<List<Quote>> search(String query);

  Future<List<String>> getTags();

  Future<List<Quote>> getTag(String tag);

  Future<Quote> getQuote(String quoteId);

  Future<Quote> random();
}

class TronaldException implements Exception {
  String _message;

  TronaldException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}
