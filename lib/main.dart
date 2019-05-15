// ignore: uri_does_not_exist
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/material.dart';

void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
    // ignore: invalid_override
    @override
  Widget build(BuildContext context) => new MaterialApp(
          // ignore: invalid_override
          debugShowCheckedModeBanner: false,
          title:  'flutter demo',
          home: new MyHomePage(title: 'je veux ...'),
          theme: new ThemeData(
            primarySwatch: Colors.red,


          ),

        );
}

class MyHomePage extends StatefulWidget {
  var title;

  MyHomePage({Key key, this.title}): super(key:key);
//  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nouvelleListe;
     @override
  Widget build(BuildContext context) {
       return new Scaffold(
         appBar:  new AppBar(
           title: new Text(widget.title),
                               actions: <Widget>[
                                 new FlatButton(onPressed: ajouter, child: new Text("Ajouter", style: new TextStyle(color: Colors.white),))

                               ],


                    ),

         body: new Center(

         ),
       );
  }

  Future<Null> ajouter() async {
             await showDialog(
                 context: context,
               barrierDismissible: false,
               builder: (BuildContext buildContext){
                   return new AlertDialog(
                     title: new Text('Ajouter une liste de souhait '),
                     content: new TextField(
                         decoration: new InputDecoration(
                           labelText: "Liste:",
                           hintText: "ex:mes prochains jeux video  ",
                         ),
                       onChanged: (String str){
                            nouvelleListe = str;
                       },
                     ),
                     actions: <Widget>[
                       
                       new FlatButton(onPressed: (() => Navigator.pop(buildContext)), child: new Text('annuler')),
                       new FlatButton(onPressed: (){

                         // Ajouter le code pour pouvoir ajouter dans la base de donnee
                         Navigator.pop(buildContext);
                       }, child: new Text('Valider', style: new TextStyle(color: Colors.blue),))
                     ],

                   );
               }

             );
             }
}