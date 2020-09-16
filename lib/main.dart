import 'package:flutter/material.dart';
import 'package:payment_ui_challenge/bmi_calculator/bmi_screen.dart';
import 'package:payment_ui_challenge/custom_login_app/ui/login_screen.dart';
import 'package:payment_ui_challenge/stless_vs_stfull/ui/home_screen.dart';
import 'payment_ui_challenge/ui/payment_screen.dart';
import 'planet_weight_measurement/planet_weight.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PlanetWeight.id,
      routes: {
        MakeItRich.id: (_) => MakeItRich(),
        PaymentScreen.id: (_) => PaymentScreen(),
        LoginScreen.id: (_) => LoginScreen(),
        PlanetWeight.id: (_) => PlanetWeight(),
        BmiScreen.id: (_) => BmiScreen(),
      },
    );
  }
}
