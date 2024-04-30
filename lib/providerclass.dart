import 'package:flutter/material.dart';

class TextProvider extends ChangeNotifier{

String data='';
String data2='';
String data3 ='';

Future<void> setData(String text,text2,text3)async {
data=text;
data2=text2;
data3=text3;

notifyListeners();
}


}