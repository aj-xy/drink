// To parse this JSON data, do
//
//     final cocktail = cocktailFromJson(jsonString);

import 'dart:convert';

Cocktail cocktailFromJson(String str) => Cocktail.fromJson(json.decode(str));

String cocktailToJson(Cocktail data) => json.encode(data.toJson());

class Cocktail {
  List<Ingredient> ingredients;

  Cocktail({
    required this.ingredients,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) => Cocktail(
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
      };
}

class Ingredient {
  String idIngredient;
  String strIngredient;
  String strDescription;
  String strType;
  String strAlcohol;
  String strAbv;

  Ingredient({
    required this.idIngredient,
    required this.strIngredient,
    required this.strDescription,
    required this.strType,
    required this.strAlcohol,
    required this.strAbv,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        idIngredient: json["idIngredient"],
        strIngredient: json["strIngredient"],
        strDescription: json["strDescription"],
        strType: json["strType"],
        strAlcohol: json["strAlcohol"],
        strAbv: json["strABV"],
      );

  Map<String, dynamic> toJson() => {
        "idIngredient": idIngredient,
        "strIngredient": strIngredient,
        "strDescription": strDescription,
        "strType": strType,
        "strAlcohol": strAlcohol,
        "strABV": strAbv,
      };
}
