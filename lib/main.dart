import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rps/Result.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var p1 = "assets/arrow.png";
  var p2 = "assets/arrow.png";



  var click1 = false;
  var click2 = false;


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);



    return Scaffold(
      body: Builder(
          builder: (context) {
            return Column(

              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    //color: Color(0xff101820FF),
                    color: Colors.red[400],


                    child: Column(
                      children: [
                        Expanded(

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton.extended(
                                  backgroundColor: Colors.red[900],
                                  heroTag: 'p1',
                                  label: RotatedBox(
                                      quarterTurns: 2,
                                      child: Text(click1 == false
                                          ? "CLICK"
                                          : "Clicked")),
                                  onPressed: changeNameP1),
                            )),
                         Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: Text("Player 1",
                                  style: TextStyle(color: Colors.red[900],
                                      fontSize: 30,
                                      height: 2,
                                      letterSpacing: 5,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            )),
                        Expanded(
                          flex: 4,
                          child: RotatedBox(
                              quarterTurns: 2,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8 ,vertical: 8),
            child:Align(
            alignment: Alignment.center,
                            child: Image.asset(click1==false?"assets/arrow.png":ImageOut(p1)),)
                          )
                          ),),
                      ],
                    ),
                  ),
                ),
                Expanded(

                  flex: 1,
                  child: Container(
                    //color: Color(0xffFEE715FF),
                    color: Colors.yellow[400],


                    child: Column(

                      children: [
                        Expanded(
                          flex: 4,
                          child: RotatedBox(
                            quarterTurns: 0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8 ,vertical: 8),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(click2==false?"assets/arrow.png":ImageOut(p2))),
                            ),
                          ),),
                         Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child:
                              Text("Player 2",

                                style: TextStyle(
                                    color: Colors.yellow[900],
                                    fontSize: 30,
                                    height: 2,
                                    letterSpacing: 5,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )),

                        Expanded(

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton.extended(
                                  backgroundColor:  Colors.yellow[900],
                                  heroTag: 'p2',
                                  label: Text(
                                      click2 == false ? "CLICK" : "Clicked"),
                                  onPressed: changeNameP2),
                            ))

                      ],
                    ),
                  ),
                )
              ],
            );
          }
      ),
    );
  }


    changeNameP1() {
      setState(() {
        click1 == false ? p1 = RPS() : null;
        click1 = true;

        (click1 == true && click2 == true) ?
        Future.delayed(Duration(milliseconds: 500), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Result(p1, p2)),
              (Route<dynamic> route) => false,
        ); }): null;
      });
      return true;
    }
    changeNameP2() {
      setState(() {
        click2 == false ? p2 = RPS() : null;
        click2 = true;
        (click1 == true && click2 == true) ?
        Future.delayed(Duration(milliseconds: 500), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Result(p1, p2)),
                (Route<dynamic> route) => false,
          ); }): null;
      });
      return true;
    }
  }


  RPS() {
    var WhichOne = ["R", "P", "S"];
    int random = Random().nextInt(3);
    //generate random number below 1000
    return WhichOne[random];
  }

  ImageOut(x) {
    if (x == "R")
      return ("assets/rock.png");
    else if (x == "P")
      return ("assets/paper.png");
    else
      return ("assets/scissor.png");
  }
