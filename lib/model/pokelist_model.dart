import 'dart:convert';

class PokeList {
  PokeList({
    required this.count,
    this.next,
    required this.results,
  });

  final int count;
  final String? next;
  final List<Result> results;

  factory PokeList.fromJson(String str) => PokeList.fromMap(json.decode(str));

  factory PokeList.fromMap(Map<String, dynamic> json) => PokeList(
        count: json["count"],
        next: json["next"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
      );
}

class Result {
  Result({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );
}
