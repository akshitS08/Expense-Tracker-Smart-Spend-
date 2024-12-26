

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_spend/screens/dashboard.dart';
import 'db.dart';

class AuthService{
  var db = Db();
  createUser(data, context) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      await db.addUser(data, context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashBoard()),
      );
    }
    catch (e) {
      showDialog(context: context, builder: (context){
        return AlertDialog(
        title: const Text("Sign Up Failed"),
      content: Text(e.toString()),
        );
      });
    }
  }

  login(data, context) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashBoard()),
      );
    }
    catch (e) {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: const Text("Login Error"),
          content: Text(e.toString()),
        );
      });
    }
  }
}