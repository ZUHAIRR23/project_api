import 'package:flutter/material.dart';
import 'package:untitled/model/photos.dart';
import 'package:untitled/ui/login_screen.dart';
import 'package:untitled/ui/main_screen.dart';
import 'package:untitled/ui/photos_screen.dart';
import 'package:untitled/ui/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: RegisterScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/login' : (context) => LoginScreen(),
          '/register' : (context) => RegisterScreen(),
          '/photos' : (context) => PhotosScreen(),
        }
    );
  }
}