// To parse this JSON data, do
//
//     final ability = abilityFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Ability abilityFromMap(String str) => Ability.fromMap(json.decode(str));

String abilityToMap(Ability data) => json.encode(data.toMap());

class Ability {
  Ability({
    required this.effectChanges,
    required this.effectEntries,
    required this.flavorTextEntries,
    required this.generation,
    required this.id,
    required this.isMainSeries,
    required this.name,
    required this.names,
    required this.pokemon,
  });

  final List<EffectChange> effectChanges;
  final List<AbilityEffectEntry> effectEntries;
  final List<FlavorTextEntry> flavorTextEntries;
  final Generation generation;
  final int id;
  final bool isMainSeries;
  final String name;
  final List<Name> names;
  final List<Pokemon> pokemon;

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
        effectChanges: List<EffectChange>.from(
            json["effect_changes"].map((x) => EffectChange.fromMap(x))),
        effectEntries: List<AbilityEffectEntry>.from(
            json["effect_entries"].map((x) => AbilityEffectEntry.fromMap(x))),
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"].map((x) => FlavorTextEntry.fromMap(x))),
        generation: Generation.fromMap(json["generation"]),
        id: json["id"],
        isMainSeries: json["is_main_series"],
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromMap(x))),
        pokemon:
            List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "effect_changes":
            List<dynamic>.from(effectChanges.map((x) => x.toMap())),
        "effect_entries":
            List<dynamic>.from(effectEntries.map((x) => x.toMap())),
        "flavor_text_entries":
            List<dynamic>.from(flavorTextEntries.map((x) => x.toMap())),
        "generation": generation.toMap(),
        "id": id,
        "is_main_series": isMainSeries,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toMap())),
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toMap())),
      };
}

class EffectChange {
  EffectChange({
    required this.effectEntries,
    required this.versionGroup,
  });

  final List<EffectChangeEffectEntry> effectEntries;
  final Generation versionGroup;

  factory EffectChange.fromMap(Map<String, dynamic> json) => EffectChange(
        effectEntries: List<EffectChangeEffectEntry>.from(json["effect_entries"]
            .map((x) => EffectChangeEffectEntry.fromMap(x))),
        versionGroup: Generation.fromMap(json["version_group"]),
      );

  Map<String, dynamic> toMap() => {
        "effect_entries":
            List<dynamic>.from(effectEntries.map((x) => x.toMap())),
        "version_group": versionGroup.toMap(),
      };
}

class EffectChangeEffectEntry {
  EffectChangeEffectEntry({
    required this.effect,
    required this.language,
  });

  final String effect;
  final Generation language;

  factory EffectChangeEffectEntry.fromMap(Map<String, dynamic> json) =>
      EffectChangeEffectEntry(
        effect: json["effect"],
        language: Generation.fromMap(json["language"]),
      );

  Map<String, dynamic> toMap() => {
        "effect": effect,
        "language": language.toMap(),
      };
}

class Generation {
  Generation({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Generation.fromMap(Map<String, dynamic> json) => Generation(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

class AbilityEffectEntry {
  AbilityEffectEntry({
    required this.effect,
    required this.language,
    required this.shortEffect,
  });

  final String effect;
  final Generation language;
  final String shortEffect;

  factory AbilityEffectEntry.fromMap(Map<String, dynamic> json) =>
      AbilityEffectEntry(
        effect: json["effect"],
        language: Generation.fromMap(json["language"]),
        shortEffect: json["short_effect"],
      );

  Map<String, dynamic> toMap() => {
        "effect": effect,
        "language": language.toMap(),
        "short_effect": shortEffect,
      };
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.versionGroup,
  });

  final String flavorText;
  final Generation language;
  final Generation versionGroup;

  factory FlavorTextEntry.fromMap(Map<String, dynamic> json) => FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: Generation.fromMap(json["language"]),
        versionGroup: Generation.fromMap(json["version_group"]),
      );

  Map<String, dynamic> toMap() => {
        "flavor_text": flavorText,
        "language": language.toMap(),
        "version_group": versionGroup.toMap(),
      };
}

class Name {
  Name({
    required this.language,
    required this.name,
  });

  final Generation language;
  final String name;

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        language: Generation.fromMap(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "language": language.toMap(),
        "name": name,
      };
}

class Pokemon {
  Pokemon({
    required this.isHidden,
    required this.pokemon,
    required this.slot,
  });

  final bool isHidden;
  final Generation pokemon;
  final int slot;

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        isHidden: json["is_hidden"],
        pokemon: Generation.fromMap(json["pokemon"]),
        slot: json["slot"],
      );

  Map<String, dynamic> toMap() => {
        "is_hidden": isHidden,
        "pokemon": pokemon.toMap(),
        "slot": slot,
      };
}
