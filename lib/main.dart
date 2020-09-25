import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/home.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  ///Set preferred orientation to portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  static const _primaryColor = 0xFF80CBC4;

  static const MaterialColor _primary = MaterialColor(
    _primaryColor,
    <int, Color>{
      50: Color(0xFFFDFEFF),
      100: Color(0xFFFDFEFE),
      200: Color(0xFFE0F2F1),
      300: Color(0xFFB2DFDB),
      400: Color(0xFFB2DFDB),
      500: Color(_primaryColor),
      600: Color(0xFF4DB6AC),
      700: Color(0xFF26A69A),
      800: Color(0xFF009688),
      900: Color(0xFF00897B),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MVC Demo',
        theme: ThemeData(
          primarySwatch: _primary,
          buttonColor: _primary.shade500,
        ),
        initialRoute: '/',
        routes: {
          "/": (_) => Home(),
        },
      );
  }
}

