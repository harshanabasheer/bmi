import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class BmiCaculation extends StatefulWidget {
  const BmiCaculation({super.key});

  @override
  State<BmiCaculation> createState() => _BmiCaculationState();
}
enum Genter{
  male,female
}

class _BmiCaculationState extends State<BmiCaculation> {
  Genter? selectedgenter;
  int weight =60;
  int age =20;
  int height=180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:

        Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("BMI Calculator",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.pink,fontStyle: FontStyle.italic,)),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child:  FloatingActionButton(
                                  backgroundColor: selectedgenter == Genter.male? Colors.white:Colors.pink,
                                    onPressed: () {
                                    setState(() {
                                      selectedgenter = Genter.male;
                                    });
                                    },
                                    child: Icon(
                                      Icons.male,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                          child:  FloatingActionButton(
                            backgroundColor: selectedgenter==Genter.female? Colors.white:Colors.pink,
                            onPressed: () {
                              setState(() {
                                selectedgenter = Genter.female;
                              });
                            },
                            child: Icon(
                              Icons.female,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                      )],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: 200,
                          height: 150,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            border: Border.all(),
                          ),
                          child: Column(
                            children: [
                              Text("Weight",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                              Text(weight.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                              Row(
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: Colors.black,
                                    onPressed: () {
                                      setState(() {
                                        weight ++;
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 70,),
                                  FloatingActionButton(
                                    backgroundColor: Colors.black,
                                    onPressed: () {
                                      setState(() {
                                        weight --;
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                  ),

                                ],
                              )

                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          width: 200,
                          height: 150,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            border: Border.all(),
                          ),
                          child: Column(
                            children: [
                              Text("Age",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                              Text(age.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                              Row(
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: Colors.black,
                                    onPressed: () {
                                      setState(() {
                                        age ++;
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 70,),
                                  FloatingActionButton(
                                    backgroundColor: Colors.black,
                                    onPressed: () {
                                      setState(() {
                                        age --;
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                  ),

                                ],
                              )

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40,),
                  Container(
                    width: 500,
                    height:150,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      border: Border.all(),
                    ),
                    child: Column(
                      children: [
                        Text("Height",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                        Text(height.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                        Slider(
                          label: "Select Age",
                          value: height.toDouble(),
                          activeColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                          min: 100,
                          max: 200,
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.only(left:3,right:3),
                    child: ElevatedButton(onPressed: (){
                      BmiLogic calculate= BmiLogic(height: height, weight: weight);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(bmiresult: calculate.bmicalculation(), textresult: calculate.result(), message: calculate.message())));
                    },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // Background color
                        padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(
                        ),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: Text("CALCULATE",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],),
        )
    );

  }


  // FloatingActionButton buildFloatingActionButton(VoidCallback voidCallback) {
  //   return FloatingActionButton(
  //                               backgroundColor: Colors.black,
  //                               onPressed: voidCallback,
  //                               child: Icon(
  //                                 Icons.add,
  //                                 size: 10,
  //                                 color: Colors.white,
  //                               ),
  //                             );
  // }
}
class BmiLogic{
  late final int height,weight;
  late double bmiresult;

  BmiLogic({required this.height, required this.weight});

  String bmicalculation() {
    bmiresult = weight / pow(height / 100, 2);
    return bmiresult.toStringAsFixed(1);
    // print("Your BMI is: $bmi");
  }

  String result() {
    if (bmiresult < 18.5) {
      return("BMI Category: Underweight");
    } else if (bmiresult >= 18.5 && bmiresult <= 24.9) {
      return("BMI Category: Normal weight");
    } else if (bmiresult >= 25 && bmiresult <= 29.9) {
      return("BMI Category: Overweight");
    } else {
      return("BMI Category: Obese");
    }
  }
  String message() {
    if (bmiresult < 18.5) {
      return("You have under body Weight");
    } else if (bmiresult >= 18.5 && bmiresult <= 24.9) {
      return("You have normal body Weight good job");
    } else if (bmiresult >= 25 && bmiresult <= 29.9) {
      return("You have over body Weight");
    } else {
      return("BMI Category: Obese");
    }
  }
}

