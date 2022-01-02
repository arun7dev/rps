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
  var result="";
  @override

    Future<bool> _onWillPop() async {
    return Back(context);
    }

    @override
    Widget build(BuildContext context) {
      return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  child: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        Res(widget.p1, widget.p2),style: TextStyle(fontSize: MediaQuery.of(context).size.width/7,fontWeight: FontWeight.bold,color: Colors.white),
                      textAlign: TextAlign.center,
                      ),
                      Text(result,style: TextStyle(fontSize: MediaQuery.of(context).size.width/5,fontWeight: FontWeight.bold,color: Colors.red),
                        textAlign: TextAlign.center,),
                    ],
                  )),
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






Res(p1,p2){


  if(p1 == "R" && p2 == "R"){

      result="TIE!";

    return ("Rock meets Rock");
   
  }
  else if(p1 =="R" && p2== "P"){
    result="Player 2 wins!";
    return ("Rock is covered by Paper");
    
  }
  else if(p1 == "R" && p2 == "S"){
    result="Player 1 wins!";
    return ( "Rock crushes Scissors");
    
  }
  else if(p1 == "P" && p2 == "R"){
    result="Player 1 wins!";
    return ( "Paper covers Rock");
    
  }
  else if(p1 == "P" && p2 == "P"){
    result="TIE!";
    return ("Paper meets Paper");
    
  }
  else if(p1 == "P" && p2 == "S"){
    result="Player 2 wins!";
    return ("Paper is cut by Scissors");
   
  }
  else if( p1 == "S" && p2 == "R"){
    result="Player 2 wins!";
    return ("Scissors are crushed by Rock");

  }
  else if( p1 == "S" && p2 == "P"){
    result="Player 1 wins!";
  return (  "Scissors cuts Paper");
   
  }
  else if(p1 == "S" && p2 == "S"){
    result="TIE!";
  return ("Scissors meet Scissors");
    
  }
 
}

Back(context) {

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) =>MyHomePage()),
          (Route<dynamic> route) => false,
    );


}
}