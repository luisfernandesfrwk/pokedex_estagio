import 'dart:convert';

class PokeList {
  PokeList({
    required this.count,
    required this.results,
  });

  final int count;
  final List<Result> results;

  factory PokeList.fromJson(String str) => PokeList.fromMap(json.decode(str));

  factory PokeList.fromMap(Map<String, dynamic> json) => PokeList(
        count: json["count"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
      );
}

class Result {
  Result({
    required this.name,
    required this.url,
    this.type,
  });

  final String name;
  final String url;
  String? type;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  factory Result.fromMap(Map<String, dynamic> json) {
    return Result(
      type: json["type"],
      name: json["name"],
      url: json["url"],
    );
  }
}
