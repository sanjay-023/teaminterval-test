// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

class DataModel {
  DataModel({
    required this.drinks,
  });

  List<Drink>? drinks;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        drinks: json["drinks"] == null
            ? null
            : List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
      );
}

class Drink {
  Drink({
    this.idDrink,
    this.strDrink,
    this.strCategory,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strInstructionsDe,
    this.strInstructionsIt,
    this.strDrinkThumb,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  String? idDrink;
  String? strDrink;
  String? strCategory;
  String? strAlcoholic;
  String? strGlass;
  String? strInstructions;
  String? strInstructionsDe;
  String? strInstructionsIt;
  String? strDrinkThumb;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strCreativeCommonsConfirmed;
  DateTime? dateModified;

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        idDrink: json["idDrink"],
        strDrink: json["strDrink"],
        strCategory: json["strCategory"],
        strAlcoholic: json["strAlcoholic"],
        strGlass: json["strGlass"],
        strInstructions: json["strInstructions"],
        strInstructionsDe: json["strInstructionsDE"],
        strInstructionsIt: json["strInstructionsIT"],
        strDrinkThumb: json["strDrinkThumb"],
        strIngredient1: json["strIngredient1"],
        strIngredient2: json["strIngredient2"],
        strIngredient3: json["strIngredient3"],
        strIngredient4: json["strIngredient4"],
        strIngredient5: json["strIngredient5"],
        strMeasure1: json["strMeasure1"],
        strMeasure2: json["strMeasure2"],
        strMeasure3: json["strMeasure3"],
        strMeasure4: json["strMeasure4"],
        strMeasure5: json["strMeasure5"],
        strCreativeCommonsConfirmed: json["strCreativeCommonsConfirmed"],
        dateModified: json["dateModified"] == null
            ? null
            : DateTime.parse(json["dateModified"]),
      );
}
