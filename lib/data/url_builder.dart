class UrlBuilder {
  static const _kBaseUrl = 'https://api.tronalddump.io';

  // https://api.tronalddump.io/search/quote?query={query}
  static String search(String quoteId) =>
      _kBaseUrl + "/search/quote?query=$quoteId";

  static String tags() => _kBaseUrl + "/tag";

  // https://api.tronalddump.io/tag/Hillary%20Clinton
  static String tag(String tag) => _kBaseUrl + "/tag/$tag";

  // https://api.tronalddump.io/quote/{id}
  static String quote(String quoteId) => _kBaseUrl + "/quote/$quoteId";

  // https://api.tronalddump.io/random/quote
  static String random() => _kBaseUrl + "/random/quote";
}
