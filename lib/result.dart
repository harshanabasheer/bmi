import 'package:flutter/material.dart';
import 'package:bmi/bmicalculation.dart';
import 'dart:math';

class Result extends StatelessWidget {
  // const Result({super.key});

final String bmiresult,textresult,message;

Result({required this.bmiresult, required this.textresult,required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:
        Padding(
          padding: const EdgeInsets.all(20.0),
          child:
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Your Result",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.pink)),
                  SizedBox(height: 100),
                  Text(textresult.toString(),style: TextStyle(fontSize: 20,color: Colors.pink)),
                  SizedBox(height: 20),
                  Text(bmiresult.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Colors.pink)),
                  SizedBox(height: 20),
                  Text(message.toString(),style: TextStyle(fontSize: 15,color: Colors.pink)),
                  SizedBox(height: 200),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BmiCaculation()));
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink, // Background color
                      padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text("Re-CALCULATE",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                  ),


                ]
            ),
          ),

        )

    );

  }
}
