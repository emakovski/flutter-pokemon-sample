import 'dart:convert';

import 'package:pokedex_test/features/pokedex/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    required super.baseExperience,
    required super.height,
    required super.heldItems,
    required super.id,
    required super.isDefault,
    required super.name,
    required super.weight,
    required this.abilitiesModel,
    required this.typesModel,
  }) : super(abilities: abilitiesModel, types: typesModel);

  final List<AbilityElementModel> abilitiesModel;
  final List<TypeModel> typesModel;

  factory PokemonModel.fromJson(String str) =>
      PokemonModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromMap(Map<String, dynamic> json) => PokemonModel(
        baseExperience: json["base_experience"],
        height: json["height"],
        heldItems: List<dynamic>.from(json["held_items"].map((x) => x)),
        id: json["id"],
        isDefault: json["is_default"],
        name: json["name"],
        weight: json["weight"],
        abilitiesModel: List<AbilityElementModel>.from(
            json["abilities"].map((x) => AbilityElementModel.fromMap(x))),
        typesModel: List<TypeModel>.from(
            json["types"].map((x) => TypeModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "base_experience": baseExperience,
        "height": height,
        "held_items": List<dynamic>.from(heldItems.map((x) => x)),
        "id": id,
        "is_default": isDefault,
        "name": name,
        "weight": weight,
        "abilities": List<dynamic>.from(abilitiesModel.map((x) => x.toMap())),
        "types": List<dynamic>.from(typesModel.map((x) => x.toMap())),
      };
}

class AbilityElementModel extends AbilityElement {
  const AbilityElementModel({
    required this.abilityModel,
    required super.isHidden,
    required super.slot,
  }) : super(ability: abilityModel);

  final TypeClassModel abilityModel;

  factory AbilityElementModel.fromJson(String str) =>
      AbilityElementModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AbilityElementModel.fromMap(Map<String, dynamic> json) =>
      AbilityElementModel(
        abilityModel: TypeClassModel.fromMap(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toMap() => {
        "ability": abilityModel.toMap(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class TypeClassModel extends TypeClass {
  const TypeClassModel({
    required super.name,
    required super.url,
  });

  factory TypeClassModel.fromJson(String str) =>
      TypeClassModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TypeClassModel.fromMap(Map<String, dynamic> json) => TypeClassModel(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

class TypeModel extends Type {
  const TypeModel({
    required super.slot,
    required this.typeModel,
  }) : super(type: typeModel);

  final TypeClassModel typeModel;

  factory TypeModel.fromJson(String str) => TypeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TypeModel.fromMap(Map<String, dynamic> json) => TypeModel(
        slot: json["slot"],
        typeModel: TypeClassModel.fromMap(json["type"]),
      );

  Map<String, dynamic> toMap() => {
        "slot": slot,
        "type": typeModel.toMap(),
      };
}
