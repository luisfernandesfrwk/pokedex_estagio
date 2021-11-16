<<<<<<< HEAD
import 'package:meta/meta.dart';
import 'dart:convert';

class PokeList {
  PokeList({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final String next;
  final dynamic previous;
  final List<Result> results;

  factory PokeList.fromJson(String str) => PokeList.fromMap(json.decode(str));

  factory PokeList.fromMap(Map<String, dynamic> json) => PokeList(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
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
=======
class PokeList_Model {
  int count;
  String next;
  Null previous;
  List<Results> results;

  PokeList_Model({this.count, this.next, this.previous, this.results});

  PokeList_Model.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }
}

class Results {
  String name;
  String url;

  Results({this.name, this.url});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
>>>>>>> 24445eb8caac9015d00a9d77959b6edb9d0e40a3
