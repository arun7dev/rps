import 'package:flutter/material.dart';
import 'package:rps/main.dart';

class Result extends StatefulWidget {
  Result(this.p1,this.p2);
  var p1;
  var p2;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override

    Future<bool> _onWillPop() async {
    return Back(context);
    }

    @override
    Widget build(BuildContext context) {
      return new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  child: Center(child: Text(Res(widget.p1, widget.p2),style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),)),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () { Back(context);},
                      child: Text("Play Again",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    ),
                  )
              )
            ],
          ),
        ),
      );
    }



}


Res(p1,p2){


  if(p1 == "R" && p2 == "R"){
    return ("Rock meets Rock its a tie!");
   
  }
  else if(p1 =="R" && p2== "P"){
    return ("Rock is covered by Paper Player 2 wins!");
    
  }
  else if(p1 == "R" && p2 == "S"){
    return ( "Rock crushes Scissors Player 1 wins!");
    
  }
  else if(p1 == "P" && p2 == "R"){
    return ( "Paper covers Rock Player 1 wins!");
    
  }
  else if(p1 == "P" && p2 == "P"){
    return ("Paper meets Paper its a tie!");
    
  }
  else if(p1 == "P" && p2 == "S"){
    return ("Paper is cut by Scissors  Player 2 wins!");
   
  }
  else if( p1 == "S" && p2 == "R"){
    return ("Scissors are crushed by Rock Player 2 wins!");

  }
  else if( p1 == "S" && p2 == "P"){
  return (  "Scissors cuts Paper Player 1 wins!");
   
  }
  else if(p1 == "S" && p2 == "S"){
  return ("Scissors meet Scissors its a tie!");
    
  }
 
}

Back(context) {

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) =>MyHomePage()),
          (Route<dynamic> route) => false,
    );


}