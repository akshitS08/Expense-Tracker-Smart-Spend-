import 'package:flutter/material.dart';
import 'package:smart_spend/screens/login_screen.dart';
import 'package:smart_spend/services/auth_service.dart';
import 'package:smart_spend/utils/appvalidator.dart';

// Import the IntroScreen

class SignUPView extends StatefulWidget {
  const SignUPView({super.key});

  @override
  State<SignUPView> createState() => _SignUPViewState();
}

class _SignUPViewState extends State<SignUPView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();
  final _emailNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  var authService = AuthService();
  var isLoader = false;

  Future<void> _submitForm() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });

      var data = {
        "username": _userNameController.text,
        "email": _emailNameController.text,
        "phone": _phoneController.text,
        "password": _passwordController.text,
        'remainingAmount' :0,
        'totalCredit':0,
        'totalDebit':0
      };

      await authService.createUser(data, context);

      setState(() {
        isLoader = false;
      });

      // Optionally, you can display a success message after form submission
    }
  }

  var appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  width: 250,
                  child: Text(
                    "Create New Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: _userNameController,
                  style: const TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _buildInputDecoration("Username", Icons.person),
                  validator: appValidator.validateUserName,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailNameController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _buildInputDecoration("Email", Icons.email),
                  validator: appValidator.validateEmail,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _phoneController,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _buildInputDecoration("Phone Number", Icons.call),
                  validator: appValidator.validatePhoneNumber,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _passwordController,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _buildInputDecoration("Password", Icons.lock),
                  validator: appValidator.validatePassword,
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white),
                    onPressed: () {
                      isLoader ? print("Loading") : _submitForm();
                    },
                    child: isLoader
                        ? const Center(child: CircularProgressIndicator())
                        : const Text(
                      "Create",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginView()),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
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
          borderSide: BorderSide(color: Colors.deepPurpleAccent)),
      focusedBorder:
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      labelStyle: const TextStyle(color: Colors.white70),
      labelText: label,
      suffixIcon: Icon(
        sufficIcon,
        color: Colors.deepPurple,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}