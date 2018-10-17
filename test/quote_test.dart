import 'dart:convert';

import 'package:test/test.dart';
import 'package:tronald_dump/data/quote.dart';

void main() {
  test('decode json to quote', () {
    final JsonDecoder decoder = new JsonDecoder();
    Quote quote = Quote.fromMap(decoder.convert("""
{  
   "appeared_at":"2016-10-10T01:28:36",
   "created_at":"2016-11-20T01:32:01.238195",
   "quote_id":"e-kzvT1URoa7-klAGAI26Q",
   "tags":[  
      "Hillary Clinton"
   ],
   "updated_at":"2016-11-20T01:32:01.238195",
   "value":"Basically nothing Hillary has said about her secret server has been true. #CrookedHillary",
   "_links":{  
      "self":{  
         "href":"\/quote\/e-kzvT1URoa7-klAGAI26Q"
      }
   },
   "_embedded":{  
      "author":[  
         {  
            "created_at":"2016-11-14T01:14:02.096776",
            "bio":null,
            "author_id":"wVE8Y7BoRKCBkxs1JkqAvw",
            "name":"Donald Trump",
            "slug":"donald-trump",
            "updated_at":"2016-11-14T01:14:02.096776"
         }
      ],
      "source":[  
         {  
            "created_at":"2016-11-20T01:32:00.845412",
            "filename":null,
            "quote_source_id":"NCuV0j9GQUm739H9d1GnEw",
            "remarks":null,
            "updated_at":"2016-11-20T01:32:00.845412",
            "url":"https:\/\/twitter.com\/realDonaldTrump\/status\/785290904093491200"
         }
      ]
   }
}    
    """));

    expect(
        quote.id,
        "e-kzvT1URoa7-klAGAI26Q");

    expect(
        quote.text,
        "Basically nothing Hillary has said about her secret server has been true. #CrookedHillary");

    expect(
        quote.url,
        "https:\/\/twitter.com\/realDonaldTrump\/status\/785290904093491200");

    expect(
        quote.appearedAt,
        DateTime.parse("2016-10-10T01:28:36"));

    expect(
        quote.tags,
        ["Hillary Clinton"]);
  });
}
