import 'package:bank2/pages/buttonNav.dart';
import 'package:flutter/material.dart';


class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavPage(),
      appBar: AppBar(
        backgroundColor: Colors.black,

      ),
    );
  }
}