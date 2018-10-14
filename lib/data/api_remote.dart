import 'dart:async';
import 'dart:convert';
import 'package:tronald_dump/data/quote.dart';
import 'package:tronald_dump/data/url_builder.dart';
import 'package:http/http.dart' as http;

import 'package:tronald_dump/data/api.dart';

class TronaldRepositoryRemote implements TronaldRepository {
  final JsonDecoder _decoder = new JsonDecoder();

  @override
  Future<Quote> getQuote(String quoteId) async {
    final response = await _performGetRequest(UrlBuilder.quote(quoteId));

    final json = _decoder.convert(response.body);
    return Quote.fromMap(json);
  }

  @override
  Future<List<Quote>> getTag(String tag) async {
    final response = await _performGetRequest(UrlBuilder.tag(tag));

    final json = _decoder.convert(response.body);
    final List<dynamic> tagsJson = json['_embedded']['tags'];

    return tagsJson.map((quoteJson) => Quote.fromMap(quoteJson));
  }

  @override
  Future<List<String>> getTags() async {
    final response = await _performGetRequest(UrlBuilder.tags());
    final json = _decoder.convert(response.body);
    return json['_embedded'].cast<String>();
  }

  @override
  Future<Quote> random() async {
    final response = await _performGetRequest(UrlBuilder.random());

    final json = _decoder.convert(response.body);
    return Quote.fromMap(json);
  }

  @override
  Future<List<Quote>> search(String query) async {
    final response = await _performGetRequest(UrlBuilder.search(query));

    final json = _decoder.convert(response.body);
    final List<dynamic> tagsJson = json['_embedded']['quotes'];

    return tagsJson.map((quoteJson) => Quote.fromMap(quoteJson));
  }

  ///////////

  Future<http.Response> _performGetRequest(String url) async {
    final response = await http.get(url);
    _validateResponse(response);
    return response;
  }

  void _validateResponse(http.Response response) {
    final String jsonBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      throw new TronaldException(
          "Error with network connection [StatusCode:$statusCode, Error:${response.body}]");
    }
  }
}
