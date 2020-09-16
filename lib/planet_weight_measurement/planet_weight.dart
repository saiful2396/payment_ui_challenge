import 'package:flutter/material.dart';

class PlanetWeight extends StatefulWidget {
  static const id = "planet_weight";
  @override
  _PlanetWeightState createState() => _PlanetWeightState();
}

class _PlanetWeightState extends State<PlanetWeight> {

  final TextEditingController _weightController = TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedResult = "";

  void handleValueChanged (int value){
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedResult = "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedResult = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedResult = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
      }
    });
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    }else {
      print('wrong!');
      return int.parse('180') * 0.38;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3F4448),
      appBar: AppBar(
        backgroundColor: Color(0xFF24292E),
        title: Text('Weight on planet X'),
        centerTitle: true,
      ),

      body: Container(
        child: ListView(
          padding: EdgeInsets.all(2.5),
          children: [
            Image.asset(
              'assets/planet.png',
              height: 133,
              width: 200,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(3.5),
              child: Column(
                children: [
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person_outline, color: Colors.black,),
                      labelText: 'Your Weight On Earth: ',
                      hintText: 'In Pound',
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<int>(
                        activeColor: Color(0xFFF5EC05),
                          value: 0, groupValue: radioValue, onChanged: handleValueChanged),
                      Text(
                        'Pluto',
                        style: TextStyle(color: Color(0xFFF5EC05)),
                      ),
                      Radio<int>(
                          activeColor: Color(0xFFA83917),
                          value: 1, groupValue: radioValue, onChanged: handleValueChanged),
                      Text(
                        'Mars',
                        style: TextStyle(color: Color(0xFFA83917)),
                      ),
                      Radio<int>(
                          activeColor: Color(0xFFC78A2F),
                          value: 2, groupValue: radioValue, onChanged: handleValueChanged),
                      Text(
                        'Venus',
                        style: TextStyle(color: Color(0xFFC78A2F)),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Text(
                    _weightController.text.isEmpty ? 'Please enter your weight' :
                    '$_formattedResult lbs',
                    style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
