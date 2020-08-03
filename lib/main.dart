import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/Home.dart';

void main() {
  runApp(MaterialApp(
    home: Menu(),
    debugShowCheckedModeBanner: false,

  ));
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var color=Colors.grey[800];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Play", style: TextStyle(fontSize: 25),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
              },
            ),
            RaisedButton(
              child: Text("Change", style: TextStyle(fontSize: 25),),
              onPressed: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                setState(() {
                  color=Colors.grey[400];
                });
              },

            ),
          ],
        ),
      ),
    );
  }
}

