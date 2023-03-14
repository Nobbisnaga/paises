import 'package:flutter/material.dart';
import 'main.dart';
import 'myjson.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
String brasil = "../asset/images/brasil_bandeira.png";
String canada = "../asset/images/canada.png";
String ira = "../asset/images/ira.png";
String russia = "../asset/images/russia.png";
late String imagemGrande = brasil;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: 
              Image.asset(
                '../asset/images/bronya.jpg'
                ),
              accountName: Text(' Bronya'),
              accountEmail: Text('Bronya@gmail.com'),
              ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title:Text("Sea Atlantis"),
              subtitle:Text("Tela de Inicio"),
              onTap:(){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)=>MyJson())
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title:Text("Logout"),
              subtitle:Text("Salvar e Fechar"),
              onTap:(){
                Navigator.of(context).pushReplacementNamed('/');
              }
            ),
          ],
        )
      ),


      appBar: AppBar(
        title: Text('Lista'),
      ),
      body:ListView(
          children:[
            ListTile(
              title:Text("Brasil"),
              subtitle:Text("Brasil"),
              trailing: Icon(Icons.flag_circle),
              leading:
                Image.asset(
                '../asset/images/brasil_bandeira.png'
                ),
                onTap:(){
                  setState(() {
                    imagemGrande = brasil;
                  });
                },
            ),
            ListTile(
              title:Text("Canada"),
              subtitle:Text("Canada"),
              trailing: Icon(Icons.flag_circle),
              leading:
                Image.asset(
                '../asset/images/canada.png'
                ),
                onTap:(){
                  setState(() {
                    imagemGrande = canada;
                  });},
            ),
            ListTile(
              title:Text("Irã"),
              subtitle:Text("Irã"),
              trailing: Icon(Icons.flag_circle),
              leading:
                Image.asset(
                '../asset/images/ira.png'
                ),
                onTap:(){
                  setState(() {
                    imagemGrande = ira;
                  });},
            ),
            ListTile(
              title:Text("Russia"),
              subtitle:Text("Russia"),
              trailing: Icon(Icons.flag_circle),
              leading:
                Image.asset(
                '../asset/images/russia.png'
                ),
                onTap:(){
                  setState(() {
                    imagemGrande = russia;
                  });},
            ),

            Container(
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(imagemGrande)
              ),
            )
          ],
          ),
      );
  }
}
