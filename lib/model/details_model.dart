import 'dart:convert';

class Details {
  Details({
    required this.abilities,
    required this.id,
    required this.moves,
    required this.name,
    required this.order,
    required this.sprites,
    required this.stats,
    required this.types,
  });

  List<Ability>? abilities;
  int? id;
  List<Move>? moves;
  String? name;
  int? order;
  Sprites? sprites;
  List<Stat>? stats;
  List<Type> types;

  factory Details.fromJson(String str) => Details.fromMap(json.decode(str));

  factory Details.fromMap(Map<String, dynamic> json) => Details(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromMap(x))),
        id: json["id"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromMap(x))),
        name: json["name"],
        order: json["order"],
        sprites: Sprites.fromMap(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromMap(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
      );
}

class Ability {
  Ability({
    required this.ability,
  });

  Species ability;

  factory Ability.fromJson(String str) => Ability.fromMap(json.decode(str));

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
        ability: Species.fromMap(json["ability"]),
      );
}

class Species {
  Species({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Species.fromJson(String str) => Species.fromMap(json.decode(str));

  factory Species.fromMap(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );
}

class Move {
  Move({
    required this.move,
  });

  Species move;

  factory Move.fromJson(String str) => Move.fromMap(json.decode(str));

  factory Move.fromMap(Map<String, dynamic> json) => Move(
        move: Species.fromMap(json["move"]),
      );
}

class Sprites {
  Sprites({
    required this.other,
  });

  Other? other;

  factory Sprites.fromJson(String str) => Sprites.fromMap(json.decode(str));

  factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
      other: json["other"] == null ? null : Other.fromMap(json["other"]));
}

class Other {
  Other({
    required this.officialArtwork,
  });

  OfficialArtwork officialArtwork;

  factory Other.fromJson(String str) => Other.fromMap(json.decode(str));

  factory Other.fromMap(Map<String, dynamic> json) => Other(
        officialArtwork: OfficialArtwork.fromMap(json["official-artwork"]),
      );
}

class OfficialArtwork {
  OfficialArtwork({
    required this.frontDefault,
  });

  String frontDefault;

  factory OfficialArtwork.fromJson(String str) =>
      OfficialArtwork.fromMap(json.decode(str));

  factory OfficialArtwork.fromMap(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
      );
}

class Stat {
  Stat({
    required this.baseStat,
    required this.stat,
  });

  int baseStat;
  Species stat;

  factory Stat.fromJson(String str) => Stat.fromMap(json.decode(str));

  factory Stat.fromMap(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        stat: Species.fromMap(json["stat"]),
      );
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  int slot;
  Species type;

  factory Type.fromJson(String str) => Type.fromMap(json.decode(str));

  factory Type.fromMap(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromMap(json["type"]),
      );
}
