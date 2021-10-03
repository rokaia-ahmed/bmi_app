import 'dart:math';
import 'package:bmi/bmi_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isFemale = true;
  double height = 120.0;
  int age =15;
  int weight = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator'
        ),
      ),
      body: Column(
        children: [
          Expanded(child:
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                  setState(() {
                   isFemale = true;
                  });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20.0),
                      color: isFemale? Colors.blue : Colors.black26 ,
                    ),
                    width: 160.0,
                    child: Column(
                      children: [
                        Icon(Icons.female_outlined,
                          size: 80.0,
                        ),
                        Text('Female',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isFemale = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20.0),
                      color: !isFemale? Colors.blue : Colors.black26,
                    ),
                    width: 160.0,
                    child: Column(
                      children: [
                        Icon(Icons.male_outlined,
                          size: 80.0,
                        ),
                        Text('male',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
          Expanded(child:
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal:20 ,
              ),
              child: Container(
                color: Colors.black26,
               width: double.infinity ,
               height: 100,
               child: Center(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Height',
                     style: TextStyle(
                       color: Colors.black,
                       fontSize: 30.0,
                     ),
                   ),
                   SizedBox(
                     height: 5.0,
                   ),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     mainAxisAlignment: MainAxisAlignment.center,
                     textBaseline: TextBaseline.alphabetic,
                     children: [
                       Text('${height.round()}',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 40.0,
                           fontWeight: FontWeight.w900,
                         ),
                       ),
                       Text('Cm',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 20.0,
                         ),
                       ),
                     ],
                   ),
                   Slider(value: height,
                       max: 220.0,
                       min: 80.0,
                       onChanged:(value){
                         setState(() {
                           height = value;
                         });
                       },
                   ),
                 ],
           ),
               ),
          ),
            ),
          ),
          Expanded(child:
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20.0),
                      color: Colors.black26,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('${age}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(onPressed:(){
                             setState(() {
                               age--;
                             });
                            },
                              heroTag:age-- ,
                              child: Icon(Icons.remove),
                              mini: true,
                            ),
                            FloatingActionButton(onPressed:(){
                              setState(() {
                                age++;
                              });
                            },
                              heroTag: age++ ,
                              child: Icon(Icons.add),
                              mini: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                 SizedBox(
                   width: 20.0,
                 ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20.0),
                      color: Colors.black26,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('${weight}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(onPressed:(){
                              setState(() {
                                weight--;
                              });
                            },
                              heroTag:weight-- ,
                              child: Icon(Icons.remove),
                              mini: true,
                            ),
                            FloatingActionButton(onPressed:(){
                              setState(() {
                                weight++;
                              });
                            },
                              heroTag: weight++ ,
                              child: Icon(Icons.add),
                              mini: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
          Container(
            width: double.infinity ,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: MaterialButton(
              onPressed: (){
                double result = weight/pow(height / 100, 2);
                print(result.round());
                Navigator.push(context,
                    MaterialPageRoute(builder: ( context) => BMIResult(
                      age: age,
                      isFemale: isFemale,
                      result: result.round() ,
                    ),
                    ),
                );
              },
              child: Text('Calculate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
