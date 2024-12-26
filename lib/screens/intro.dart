import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_spend/screens/sign_up.dart'; // Ensure this is correct

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add your image
              Image.asset(
                'assets/images/Screenshot_2024-12-06_044540-removebg.png',
                width: 300,
              ),
              const SizedBox(height: 40),

              // Text with a yellow underline
              Column(
                children: [
                  Text(
                    'Smart Spend',
                    style: GoogleFonts.lato(
                      color: Colors.white,  // Change text color to white for contrast
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 120,
                    height: 2,
                    color: Colors.yellow,  // Add a yellow line under the text
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // Button that navigates to the SignUp screen
              OutlinedButton.icon(
                onPressed: () {
                  // Directly navigate to SignUpView
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUPView()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Start Spend'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
