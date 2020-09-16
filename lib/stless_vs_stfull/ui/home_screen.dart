import 'package:flutter/material.dart';

class MakeItRich extends StatefulWidget {
  static const id = 'home_screen';

  @override
  _MakeItRichState createState() => _MakeItRichState();
}

class _MakeItRichState extends State<MakeItRich> {
  int _moneyCounter = 0;

  void increment(){
    setState(() {
      _moneyCounter = _moneyCounter + 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text('Make it rich'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Get Rich!',
              style: TextStyle(color: Colors.grey[400], fontSize: 25),
            ),
            Spacer(),
            Text(
              '\$$_moneyCounter',
              style: TextStyle(color: _moneyCounter >=10000 ? Colors.deepPurple : Colors.blue, fontSize: 30,fontWeight: FontWeight.w800),
            ),
            Spacer(),
            MaterialButton(
              onPressed: () => increment(),
              color: Colors.lightGreen,
              textColor: Colors.white,
              child: Text('Let it Rain!', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
