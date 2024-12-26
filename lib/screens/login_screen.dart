import 'package:flutter/material.dart';
import 'package:smart_spend/screens/sign_up.dart';

import '../services/auth_service.dart';
import '../utils/appvalidator.dart';
import 'dashboard.dart'; // Correctly link to SignUpView

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var authService = AuthService();
  var isLoader = false;
  final _emailNameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _submitForm() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });

      var data = {
        "email": _emailNameController.text,
        "password": _passwordController.text,
      };

      await authService.login(data, context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashBoard()),
      );
      setState(() {
        isLoader = false;
      });
    }
  }

  var appValidator = AppValidator();

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(height: 50),
              const SizedBox(
                width: 250,
                child: Text(
                  "Login Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              TextFormField(
                  controller: _emailNameController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _buildInputDecoration("Email", Icons.email),
                  validator: appValidator.validateEmail),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.visiblePassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration("Password", Icons.lock),
                validator: appValidator.validatePassword,
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    isLoader ? print("Loading") : _submitForm();
                  },
                  child: isLoader
                      ? const Center(child: CircularProgressIndicator())
                      : const Text("Login", style: TextStyle(fontSize: 20)),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUPView()),
                  );
                },
                child: const Text(
                  "Create New Account",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData sufficIcon) {
    return InputDecoration(
      fillColor: Colors.white38,
      filled: true,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurpleAccent),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      labelStyle: const TextStyle(color: Colors.white70),
      labelText: label,
      suffixIcon: Icon(sufficIcon, color: Colors.deepPurple),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
