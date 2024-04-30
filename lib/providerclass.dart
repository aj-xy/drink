import 'package:flutter/material.dart';

class TextProvider extends ChangeNotifier{

String data='';
String data2='';

Future<void> setData(String text,text2)async {
data=text;
data2=text2;

notifyListeners();
}


}