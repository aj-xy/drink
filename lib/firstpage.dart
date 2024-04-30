import 'package:cocktail/model.dart';
import 'package:cocktail/providerclass.dart';
import 'package:cocktail/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Cocktail? responseData;

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://thecocktaildb.com/api/json/v1/1/search.php?i=${nameController.text}'));
    if (response.statusCode == 200) {
      setState(() {
        responseData = cocktailFromJson(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    fetchData();
    
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textprovider = Provider.of<TextProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(119, 152, 171, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13, 27, 30, 1),
        centerTitle: true,
        title: Text(
          "Drinks",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(195, 219, 197, 1)),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: responseData == null
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.local_bar_sharp),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(onTap: () async{
                       await textprovider.setData(responseData!.ingredients[0].strDescription,responseData!.ingredients[0].strIngredient);
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return secondpage();
                      },));
                    },
                      child: Container(height: 300,
                        child: Text(
                          responseData!.ingredients[0].strDescription.toString(),overflow: TextOverflow.fade,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Alcohol % :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          responseData!.ingredients[0].strAbv,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          fetchData();
                        },
                        child: Text("Generate"))
                  ],
                ),
        ),
      )),
    );
  }
}
