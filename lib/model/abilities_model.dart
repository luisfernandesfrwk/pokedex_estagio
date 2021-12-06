// To parse this JSON data, do
//
//     final ability = abilityFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Abilities abilityFromMap(String str) => Abilities.fromMap(json.decode(str));

class Abilities {
  Abilities({
    required this.effectEntries,
    required this.flavorTextEntries,
    required this.name,
  });

  List<AbilityEffectEntry>? effectEntries;
  List<FlavorTextEntry>? flavorTextEntries;
  String name;

  factory Abilities.fromMap(Map<String, dynamic> json) => Abilities(
        effectEntries: List<AbilityEffectEntry>.from(
            json["effect_entries"].map((x) => AbilityEffectEntry.fromMap(x))),
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"].map((x) => FlavorTextEntry.fromMap(x))),
        name: json["name"],
      );
}

class EffectChange {
  EffectChange({
    required this.effectEntries,
  });

  final List<EffectChangeEffectEntry> effectEntries;

  factory EffectChange.fromMap(Map<String, dynamic> json) => EffectChange(
        effectEntries: List<EffectChangeEffectEntry>.from(json["effect_entries"]
            .map((x) => EffectChangeEffectEntry.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "effect_entries":
            List<dynamic>.from(effectEntries.map((x) => x.toMap())),
      };
}

class EffectChangeEffectEntry {
  EffectChangeEffectEntry({
    required this.effect,
  });

  final String effect;

  factory EffectChangeEffectEntry.fromMap(Map<String, dynamic> json) =>
      EffectChangeEffectEntry(
        effect: json["effect"],
      );

  Map<String, dynamic> toMap() => {
        "effect": effect,
      };
}

class AbilityEffectEntry {
  AbilityEffectEntry({
    required this.effect,
    required this.shortEffect,
  });

  final String effect;
  final String shortEffect;

  factory AbilityEffectEntry.fromMap(Map<String, dynamic> json) =>
      AbilityEffectEntry(
        effect: json["effect"],
        shortEffect: json["short_effect"],
      );

  Map<String, dynamic> toMap() => {
        "effect": effect,
        "short_effect": shortEffect,
      };
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.flavorText,
  });

  final String flavorText;

  factory FlavorTextEntry.fromMap(Map<String, dynamic> json) => FlavorTextEntry(
        flavorText: json["flavor_text"],
      );

  Map<String, dynamic> toMap() => {
        "flavor_text": flavorText,
      };
}

class Name {
  Name({
    required this.name,
  });
  final String name;

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
