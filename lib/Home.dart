import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List xo = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  bool xturn = true;
  bool nextturn = true;
  String winner = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GridView.builder(
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (xo[index] == "") {
                          if (xturn) {
                            xo[index] = 'X';
                          } else {
                            xo[index] = 'O';
                          }
                          xturn = !xturn;
                        }
                      });

                      checkwin(xo);
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                            "${xo[index]}",
                            style: TextStyle(fontSize: 60),
                          )),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color: Colors.grey[500]
                      ),
                    ),
                  );
                }),
            Container(
              //color: Colors.blue,
                height: 100,
                child: Center(

                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            xo = [
                              "",
                              "",
                              "",
                              "",
                              "",
                              "",
                              "",
                              "",
                              "",
                            ];
                            nextturn=!nextturn;
                            xturn = nextturn;
                            winner = "";
                          });
                        },
                        color: Colors.grey[400],
                        icon: Icon(Icons.refresh),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }

  void checkwin(xo) {
    if ((xo[0] == xo[1]) && (xo[0] == xo[2]) && xo[0] != "") {
      setState(() {
        winner = "Winner is ${xo[0]}";
      });

      showdialog();
    } else if ((xo[3] == xo[4]) && (xo[3] == xo[5]) && xo[3] != "") {
      setState(() {
        winner = "Winner is ${xo[3]}";
      });
      showdialog();
    } else if ((xo[6] == xo[7]) && (xo[6] == xo[8]) && xo[6] != "") {
      setState(() {
        winner = "Winner is ${xo[6]}";
      });
      showdialog();
    } else if ((xo[0] == xo[3]) && (xo[0] == xo[6]) && xo[0] != "") {
      setState(() {
        winner = "Winner is ${xo[0]}";
      });
      showdialog();
    } else if ((xo[1] == xo[4]) && (xo[1] == xo[7]) && xo[1] != "") {
      setState(() {
        winner = "Winner is ${xo[1]}";
      });
      showdialog();
    } else if ((xo[2] == xo[5]) && (xo[2] == xo[8]) && xo[2] != "") {
      setState(() {
        winner = "Winner is ${xo[2]}";
      });
      showdialog();
    } else if ((xo[0] == xo[4]) && (xo[0] == xo[8]) && xo[0] != "") {
      setState(() {
        winner = "Winner is ${xo[0]}";
      });
      showdialog();
    } else if ((xo[2] == xo[4]) && (xo[2] == xo[6]) && xo[2] != "") {
      setState(() {
        winner = "Winner is ${xo[2]}";
      });
      showdialog();
    }
  }

  showdialog(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(winner,style: TextStyle(fontSize: 50),),
            backgroundColor: Colors.grey[400],
            content: Icon(Icons.cake,size: 80,color: Colors.grey[700],),
          );
        }
    );
  }
}
