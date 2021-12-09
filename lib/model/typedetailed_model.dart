// To parse this JSON data, do
//
//     final typeDetailed = typeDetailedFromMap(jsonString);

import 'dart:convert';

class TypeDetailed {
  TypeDetailed({
    required this.damageRelations,
    required this.gameIndices,
    required this.generation,
    required this.id,
    required this.moves,
    required this.name,
    required this.names,
    required this.pokemon,
  });

  DamageRelations? damageRelations;
  List<GameIndex>? gameIndices;
  Generation? generation;
  int? id;
  List<Generation>? moves;
  String? name;
  List<Name>? names;
  List<Pokemon>? pokemon;

  factory TypeDetailed.fromJson(String str) =>
      TypeDetailed.fromMap(json.decode(str));

  factory TypeDetailed.fromMap(Map<String, dynamic> json) => TypeDetailed(
        damageRelations: DamageRelations.fromMap(json["damage_relations"]),
        gameIndices: List<GameIndex>.from(
            json["game_indices"].map((x) => GameIndex.fromMap(x))),
        generation: Generation.fromMap(json["generation"]),
        id: json["id"],
        moves: List<Generation>.from(
            json["moves"].map((x) => Generation.fromMap(x))),
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromMap(x))),
        pokemon:
            List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromMap(x))),
      );
}

class DamageRelations {
  DamageRelations({
    required this.doubleDamageFrom,
    required this.doubleDamageTo,
    required this.halfDamageFrom,
    required this.halfDamageTo,
    required this.noDamageFrom,
    required this.noDamageTo,
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
        noDamageFrom: List<Generation>.from(
            json["no_damage_from"].map((x) => Generation.fromMap(x))),
        noDamageTo: List<Generation>.from(
            json["no_damage_to"].map((x) => Generation.fromMap(x))),
      );
}

class Generation {
  Generation({
    required this.name,
    required this.url,
  });

  String? name;
  String? url;

  factory Generation.fromJson(String str) =>
      Generation.fromMap(json.decode(str));

  factory Generation.fromMap(Map<String, dynamic> json) => Generation(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.generation,
  });

  int? gameIndex;
  Generation? generation;

  factory GameIndex.fromJson(String str) => GameIndex.fromMap(json.decode(str));

  factory GameIndex.fromMap(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        generation: Generation.fromMap(json["generation"]),
      );
}

class Name {
  Name({
    language,
    name,
  });

  Generation? language;
  String? name;

  factory Name.fromJson(String str) => Name.fromMap(json.decode(str));

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        language: Generation.fromMap(json["language"]),
        name: json["name"],
      );
}

class Pokemon {
  Pokemon({
    pokemon,
    slot,
  });

  Generation? pokemon;
  int? slot;

  factory Pokemon.fromJson(String str) => Pokemon.fromMap(json.decode(str));

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        pokemon: Generation.fromMap(json["pokemon"]),
        slot: json["slot"],
      );
}
