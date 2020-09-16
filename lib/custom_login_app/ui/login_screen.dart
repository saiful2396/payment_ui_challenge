import 'package:flutter/material.dart';

import 'custom_form.dart';

class LoginScreen extends StatelessWidget {
  static const id = "login_screen";
  final String appTitle = 'Login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text(appTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: CustomForm()),
    );
  }
}

