import 'package:flutter/material.dart';
import 'package:payment_ui_challenge/custom_login_app/model/name_model.dart';

class CustomForm extends StatefulWidget {
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {

  final _formKey = GlobalKey<FormState>();
  LoginData _data = LoginData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Image.asset(
            'assets/face.png',
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your name';
                } else {
                  _data.name = value;
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.5))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your password';
                }else{
                  _data.password = value;
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.5))),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      _data.name = _data.name;
                    });
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('all is good')));
                    }
                  },
                  child: Text('Submit'),
                ),
                RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.reset();
                      setState(() {
                        _data.name = "";
                      });
                    }
                  },
                  child: Text('Clear'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: _data.name.isEmpty? Text("") : Text(
                'Welcome ${_data.name}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}