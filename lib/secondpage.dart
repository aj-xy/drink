import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providerclass.dart';

class secondpage extends StatefulWidget {
  const secondpage({super.key});

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(119, 152, 171, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(195, 219, 197, 1)),
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
          child: Consumer<TextProvider>(builder: (context, provider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  provider.data2,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  provider.data,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Alcohol % :",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      provider.data3,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                )
              ],
            );
          }),
        ),
      )),
    );
  }
}
