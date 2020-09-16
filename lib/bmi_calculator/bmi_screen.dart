import 'dart:math';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  static const id = "bmi_screen";
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  TextEditingController _ageController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double inches = 0.0;
  double bmi = 0.0;
  String healthCondition = "";
  String _finalBmi = "";

  void calculateBmi () {
    setState(() {
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      inches = height*12;
      int age = int.parse(_ageController.text);
      if ((_ageController.text.isNotEmpty || age > 0)
      && (_weightController.text.isEmpty || weight > 0)
      &&(_heightController.text.isNotEmpty || height> 0)){
        bmi = (weight / pow(inches, 2)) * 703;
        if(double.parse(bmi.toStringAsFixed(1)) >= 25){
          healthCondition = 'OverWeight';
          return healthCondition;
        } else if (bmi >= 18.5){
          healthCondition = 'Normal';
          return healthCondition;
        }else{
          healthCondition = 'UnderWeight';
          return healthCondition;
        }
      } else {
        bmi = 0.0;
      }
    });
    _finalBmi =  'Your Bmi ${bmi.toStringAsFixed(1)}';
  }
  void resetBmi () {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('BMI'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(3.5),
        children: [
          Image.asset(
            'assets/bmilogo.png',
            height: 133,
            width: 200,
          ),
          Container(
            color: Colors.grey,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person_outline, color: Colors.black,),
                    labelText: 'Age ',
                    hintText: 'e.g 26',
                  ),
                ),
                TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.poll, color: Colors.black,),
                    labelText: 'Height in feet ',
                    hintText: 'e.g 5.7',
                  ),
                ),
                TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.line_weight, color: Colors.black,),
                    labelText: 'Weight in Pound ',
                    hintText: 'e.g 120',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: RaisedButton(
                    child: Text('CALCULATE'),
                    color: Colors.pink,
                    textColor: Colors.white,
                    onPressed: calculateBmi,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0,),
          Container(
            child: Column(
              children: [
                Text('$_finalBmi',
                style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.indigo, fontSize: 18),),
                SizedBox(height: 10.0,),
                Text('$healthCondition',style: TextStyle(fontWeight: FontWeight.bold,
                    color: Colors.pink, fontSize: 18),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
