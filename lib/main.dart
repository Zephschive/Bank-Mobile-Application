// ignore_for_file: prefer_const_constructors

import 'package:bank2/config.dart';
import 'package:bank2/firebase_options.dart';
import 'package:bank2/pages/homepage.dart';
import 'package:bank2/pages/login.dart';
import 'package:bank2/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async{
 
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
 LocalDB.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Astra Bank',
      home: BankApp(),
    );
  }
}

class BankApp extends StatefulWidget {
  const BankApp({super.key});

  @override
  State<BankApp> createState() => _BankAppState();
}

class _BankAppState extends State<BankApp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot) {
        if(snapshot.hasData){
          return homepage();
        } else {
        return LoginPage();
        }
      }
      );
  }
}