import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFD84D90),
          primary: Color(0xFFF0B3CD),
          secondary: Color(0xFFE36DA6),
          tertiary: Color(0xFF2D1A71),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 14.0),
          caption: TextStyle(fontSize: 12.0),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/book_nanny': (context) => HomeScreen(),
        '/how_it_works': (context) => HomeScreen(),
        '/why_nanny_vanny': (context) => HomeScreen(),
        '/my_bookings': (context) => HomeScreen(),
        '/my_profile': (context) => HomeScreen(),
        '/support': (context) => HomeScreen(),
      },
    );
  }
}
