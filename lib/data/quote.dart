class Quote {
  final String id;
  final String text;
  final String url;
  final DateTime appearedAt;
  final List<String> tags;

  const Quote(this.id, this.text, this.url, this.appearedAt, {this.tags});

  factory Quote.fromMap(Map<String, dynamic> map) {
    print("---------------");
    print("---------------");
    print(map);
    print("---------------");

    Map<String, dynamic> embedded = map['_embedded'];
    List<dynamic> sources = embedded['source'];
    final url = sources.first['url'];

    print("APPEARED AT: ${map['appeared_at']}");
    DateTime appearedAt = DateTime.parse(map['appeared_at']);

    return Quote(
        map['quote_id'],
        map['value'],
        url,
        appearedAt,
        tags: map['tags'].cast<String>()
    );
  }

  @override
  String toString() {
    return 'Quote{id: $id, text: $text, url: $url, appearedAt: $appearedAt, tags: $tags}';
  }


}
