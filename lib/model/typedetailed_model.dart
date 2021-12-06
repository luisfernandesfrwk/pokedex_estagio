// To parse this JSON data, do
//
//     final typeDetailed = typeDetailedFromMap(jsonString);

import 'dart:convert';

class TypeDetailed {
  TypeDetailed({
    this.damageRelations,
    this.generation,
    this.id,
    this.moveDamageClass,
    this.moves,
    this.name,
  });

  DamageRelations? damageRelations;
  Generation? generation;
  int? id;
  Generation? moveDamageClass;
  List<Generation>? moves;
  String? name;

  factory TypeDetailed.fromJson(String str) =>
      TypeDetailed.fromMap(json.decode(str));

  factory TypeDetailed.fromMap(Map<String, dynamic> json) => TypeDetailed(
        damageRelations: DamageRelations.fromMap(json["damage_relations"]),
        generation: Generation.fromMap(json["generation"]),
        id: json["id"],
        moveDamageClass: Generation.fromMap(json["move_damage_class"]),
        moves: List<Generation>.from(
            json["moves"].map((x) => Generation.fromMap(x))),
        name: json["name"],
      );
}

class DamageRelations {
  DamageRelations({
    this.doubleDamageFrom,
    this.doubleDamageTo,
    this.halfDamageFrom,
    this.halfDamageTo,
    this.noDamageFrom,
    this.noDamageTo,
  });

  List<Generation>? doubleDamageFrom;
  List<Generation>? doubleDamageTo;
  List<Generation>? halfDamageFrom;
  List<Generation>? halfDamageTo;
  List<Generation>? noDamageFrom;
  List<Generation>? noDamageTo;

  factory DamageRelations.fromJson(String str) =>
      DamageRelations.fromMap(json.decode(str));

  factory DamageRelations.fromMap(Map<String, dynamic> json) => DamageRelations(
        doubleDamageFrom: List<Generation>.from(
            json["double_damage_from"].map((x) => Generation.fromMap(x))),
        doubleDamageTo: List<Generation>.from(
            json["double_damage_to"].map((x) => Generation.fromMap(x))),
        halfDamageFrom: List<Generation>.from(
            json["half_damage_from"].map((x) => Generation.fromMap(x))),
        halfDamageTo: List<Generation>.from(
            json["half_damage_to"].map((x) => Generation.fromMap(x))),
        noDamageFrom:
            List<Generation>.from(json["no_damage_from"].map((x) => x)),
        noDamageTo: List<Generation>.from(
            json["no_damage_to"].map((x) => Generation.fromMap(x))),
      );
}

class Generation {
  Generation({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Generation.fromJson(String str) =>
      Generation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Generation.fromMap(Map<String, dynamic> json) => Generation(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
