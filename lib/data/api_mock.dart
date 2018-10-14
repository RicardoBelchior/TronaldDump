import 'dart:async';

import 'package:tronald_dump/data/api.dart';
import 'package:tronald_dump/data/quote.dart';

class TronaldRepositoryMock implements TronaldRepository {
  static const tagHillary = "Hillary Clinton";
  static const tagTedCruz = "Ted Cruz";
  static const tagJebBush = "Jeb Bush";
  static const tagMarcoRubio = "Marco Rubio";
  static const tagMexico = "Mexico";
  static const tagMoney = "Money";

  static const kTags = const <String>[
    tagHillary,
    tagTedCruz,
    tagJebBush,
    tagMarcoRubio,
    tagMexico,
    tagMoney,
  ];

  final kQuotes = <Quote>[
    Quote("id-1", "stupid quote #1", "quote url 1", DateTime.parse("20120227"), tags: [tagHillary]),
    Quote("id-3", "stupid quote #3", "quote url 3", DateTime.parse("20120228"), tags: [tagMoney]),
    Quote("id-2", "stupid quote #2", "quote url 2", DateTime.parse("20120414"),
        tags: [tagHillary, tagTedCruz]),
    Quote("id-4", "stupid quote #4", "quote url 4", DateTime.parse("20120610"),
        tags: [tagJebBush, tagMarcoRubio, tagMexico]),
    Quote("id-5", "stupid quote #5", "quote url 5", DateTime.parse("20121218"), tags: null),
  ];

  @override
  Future<Quote> getQuote(String quoteId) {
    return Future.value(kQuotes.firstWhere((element) => element.id == quoteId));
  }

  @override
  Future<List<Quote>> getTag(String tag) {
    return Future.value(
        //NOTE expensive operation
        List.from(kQuotes.where((quote) => quote.tags.contains(tag))));
  }

  @override
  Future<List<String>> getTags() {
    return Future.value(kTags);
  }

  @override
  Future<Quote> random() async {
    await Future.delayed(Duration(seconds: 5));

    return Future.value(kQuotes[2]);
  }

  @override
  Future<List<Quote>> search(String query) {
    //NOTE expensive operation
    return Future.value(
        List.from(kQuotes.where((quote) => quote.text.contains(query))));
  }
}
