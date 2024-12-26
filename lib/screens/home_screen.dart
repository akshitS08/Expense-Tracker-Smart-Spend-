import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_spend/widgets/add_transaction_form.dart';
import 'package:smart_spend/widgets/transactions_cards.dart';
import '../widgets/hero_card.dart';
import 'dashboard.dart';
// ignore_for_file : prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutable

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLogoutLoading = false;

  LogOut() async {
    setState(() {
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DashBoard()),
    );
    setState(() {
      isLogoutLoading = false;
    });
  }

  final userId = FirebaseAuth.instance.currentUser!.uid;


  _dialogBuilder(BuildContext context){
    return showDialog(context: context, builder: (context) {
      return const AlertDialog(
       content: AddTransactionForm(),
      );
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed:((){
          _dialogBuilder(context);
      }),
      child: const Icon(Icons.add, color: Colors.white,),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Hello",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: LogOut,
            icon: isLogoutLoading
                ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
                : const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroCard(userId: userId), // Ensure HeroCard has constrained height or adaptable layout
            const TransactionsCards(),
          ],
        ),
      ),
    );
  }
}




