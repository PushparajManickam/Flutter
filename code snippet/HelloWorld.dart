//Add google_fonts dependencies in pubspec.yaml


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(
    MaterialApp(
      home: HelloWorld(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class HelloWorld extends StatefulWidget {
  HelloWorld({Key? key}) : super(key: key);

  @override
  _HelloWorldState createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Hello World AppBar',style: GoogleFonts.sancreek(fontSize:20,color: Colors.black)),
      ),
      body: Center(
        child: Text('Hello World!!!',style: GoogleFonts.akronim(fontSize: 25, fontWeight: FontWeight.w800),)));
  }
}
