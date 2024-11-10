import 'package:chatting/Screens/HomeScreen.dart';
import 'package:chatting/Screens/LoginScreen.dart';
import 'package:chatting/Utility/colors.dart';
import 'package:chatting/resource/AuthMethods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Video Chat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        routes:{
          '/login' : (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen()
        },
        home:StreamBuilder(
            stream: AuthMethods().authChanges,
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if(snapshot.hasData){
                return const HomeScreen();
              }
              return const LoginScreen();
            })
    );
  }
}