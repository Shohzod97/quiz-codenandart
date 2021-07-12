import 'package:flutter/material.dart';
import 'package:flutter_quiz/pages/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quiz App',
        theme: ThemeData(
          primaryColor: Color(0xff5409bd),
          textTheme: GoogleFonts.openSansCondensedTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: HomePage(),
    );
  }
}


