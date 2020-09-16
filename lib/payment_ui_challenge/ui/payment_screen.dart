import 'dart:math';
import 'package:flutter/material.dart';
import 'package:payment_ui_challenge/payment_ui_challenge/utility/colors.dart';

class PaymentScreen extends StatefulWidget {
  static const id = 'payment_screen';
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  double _interest = 0.0;
  int _lengthOfLoan = 0;
  double _homePrice = 0.0;

  _paymentCalculation(homePrice, interest, lengthOfLoan) {
    int n = 12 * lengthOfLoan;
    double c = interest / 12.0 / 100.0;
    double monthlyPayment = 0.0;
    if (homePrice < 0 || homePrice.toString().isEmpty || homePrice == null){
      print('error');
    }else{
      monthlyPayment = homePrice * c * pow(1 + c, n) / (pow(1 + c, n) - 1);
    }
    //print(monthlyPayment);
      return monthlyPayment.toStringAsFixed(2);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryIndigoDark,
      appBar: AppBar(
        backgroundColor: primaryIndigoDark,
        title: Text('Monthly Payment App'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: 130,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Monthly Payment', style: TextStyle(
                  color: secondaryPurpleLight, fontSize: 18
              ),),
                  SizedBox(height: 10),
                  Text(
                      " ${ ( _homePrice > 0 && _interest > 0.0)
                          ? "\$${_paymentCalculation(_homePrice, _interest, _lengthOfLoan)}"
                          : ""}",
                    style: TextStyle(
                        color: secondaryPurpleLight, fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onChanged: (String value) {
                      try {
                        _homePrice = double.parse(value);

                      }catch (exception) {
                        _homePrice = 0.0;
                      }
                    },
                    decoration: InputDecoration(
                      prefixText: 'Home Price ',
                      prefixIcon: Icon(Icons.home, color: secondaryPurpleLight,)
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Length of Loan (years)'),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (_lengthOfLoan > 0) {
                                setState(() {
                                  _lengthOfLoan -= 5;
                                });
                              }
                            },
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: secondaryPurpleLight
                              ),
                              child: Icon(Icons.remove,color: secondaryBackgroundWhite),
                            ),
                          ),
                          Text('$_lengthOfLoan'),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _lengthOfLoan += 5;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: secondaryPurpleLight
                              ),
                              child: Icon(Icons.add,color: secondaryBackgroundWhite,),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Interest'),
                      Padding(
                        padding: EdgeInsets.only(right:16.0),
                        child: Text('${_interest.toStringAsFixed(2)}%'),
                      )
                    ],
                  ),
                  Slider(
                      min: 0.0,
                      max: 10.0,
                      activeColor: secondaryPurpleLight,
                      inactiveColor: secondaryDeepPurple,
                      value: _interest.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        _interest = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
