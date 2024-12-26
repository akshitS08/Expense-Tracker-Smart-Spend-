import 'package:flutter/material.dart';
import 'package:smart_spend/screens/home_screen.dart';
import 'package:smart_spend/screens/transaction_screen.dart';

import '../widgets/navbar.dart';

class DashBoard extends StatefulWidget{
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var isLogoutLoading = false;
  int currentIndex = 0;
  var pageViewList = [const HomeScreen(), const TransactionScreen(),];

  @override
  Widget build(context) {
    return Scaffold(
      bottomNavigationBar: NavBar(selectedIndex: currentIndex,
        onDestinationSelected: (int value) {
        setState(() {
          currentIndex = value;
        });
        },),
      body: pageViewList[currentIndex],
    );
  }
}