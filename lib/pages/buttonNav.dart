

import 'package:bank2/pages/Setting.dart';
import 'package:bank2/pages/Transfer.dart';
import 'wallet.dart';


import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  final navItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.wallet),
      label: "Wallet",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.compare_arrows),
      label: "Transfer",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];

  int index = 0;
  final pages = [
   wallet(),
    Transfer(),
    Setting(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (newIndex) {
            setState(() {
              index = newIndex;
            });
          },
          backgroundColor: Colors.white,
          items: navItems),
          body: pages[index],
    );
  }
}