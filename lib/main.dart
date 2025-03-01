import 'package:flutter/material.dart';
import 'package:stop/splash_screen/view/splash_screen.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( scaffoldBackgroundColor: const Color(0xffEBE2C6) ,  useMaterial3: false,),
      home: const SplashScreen(),
    );
  }
}
