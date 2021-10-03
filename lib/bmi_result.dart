import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  final int? result ;
  final bool? isFemale ;
  final int? age  ;

  BMIResult({
    this.result ,
    this.age ,
    this.isFemale ,
  } );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Result'
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'gender : ${isFemale! ?'female' :'male'}',
              style: TextStyle(
                fontSize: 25.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Result : $result' ,
              style: TextStyle(
                fontSize: 25.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Age : $age ',
              style: TextStyle(
                fontSize: 25.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
