import 'package:bmi_app/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const My_app());
}

class My_app extends StatelessWidget {
  const My_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI_app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
      ),
      home:const Splashscreen(),
    );
  }
}
