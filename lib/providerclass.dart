import 'package:cocktail/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TextProvider extends ChangeNotifier{

String data='';
String data2='';
String data3 ='';
  Cocktail? responseData;
String textData = '';



Future<void> setData(String text,text2,text3)async {
data=text;
data2=text2;
data3=text3;

notifyListeners();
}

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://thecocktaildb.com/api/json/v1/1/search.php?i=${textData}'));
    if (response.statusCode == 200) {

        responseData = cocktailFromJson(response.body);

    } else {
      throw Exception('Failed to load data');
    }
  }


Future<void> updateText(String text)async {
textData = text;
notifyListeners();

}

}