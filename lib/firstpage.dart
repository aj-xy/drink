import 'package:cocktail/providerclass.dart';
import 'package:cocktail/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {




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
          child:Column(
                  children: [
                    TextField(
                      onChanged: (value){
                        textprovider.updateText(value);
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.local_bar_sharp),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    textprovider.responseData == null?CircularProgressIndicator():Container(
                      height: MediaQuery.of(context).size.height/1.5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                        onTap: () async {
                                    
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return secondpage();
                            },
                          ));
                        },
                        child: Container(
                          height: 300,
                          child: Consumer<TextProvider>(
                            builder: (context,provider,child) {
                              return Text(
                                
                                provider.responseData!.ingredients[0].strDescription,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromRGBO(245, 167, 167, 1)),
                              );
                            }
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
                          Consumer<TextProvider>(
                            builder: (context,provider,child) {
                              return Text(
                                provider.responseData!.ingredients[0].strAbv,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              );
                            }
                          ),
                        ],
                      ),
                        ],
                      ),
                    ),
                    
                    ElevatedButton(
                        onPressed: () {
                          textprovider.fetchData();
                        },
                        child: Text("Generate"))
                  ],
                ),
        ),
      )),
    );
  }
}
