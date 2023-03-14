import 'dart:convert';

import 'package:flutter/material.dart';
import 'main.dart';
import 'home.dart';

class MyJson extends StatefulWidget {
  const MyJson({Key? key}) : super(key: key);

  @override
  State<MyJson> createState() => _MyJsonState();
}

class _MyJsonState extends State<MyJson> {

  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON"),
        actions: <Widget>[
          
          PopupMenuButton(
            onSelected: ((result) {
              switch(result){
                case 1:
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => MyHomePage()));
                  break;
              }
            }),
            icon: Icon(Icons.forward),
            iconSize: 40,
            itemBuilder: (context) {
              return [
                
                PopupMenuItem(
                  value: 1,
                  child: Text("Outra página"),
                ),
                
                PopupMenuItem(
                  value: 2,
                  child: Text("Mais um item (faz nada)"),
                ),  
              ];
            }
          )
        ],
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(
          "assets/dados.json"),
        builder: (context, snapshot) {
          var content = json.decode(snapshot.data.toString());
          return ListView.builder(
            itemCount: content,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.person_outline),
                title: Text(
                  content[index]["nome"]
                ),
                subtitle: Text(
                  content[index]["idade"] + " anos"
                ),
                trailing: Text(
                  content[index]["email"]
                ),
              );
            },
          );
        },
      ),
    );
  }
}