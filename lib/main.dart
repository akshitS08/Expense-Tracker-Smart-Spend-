import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_spend/firebase_options.dart';
import 'package:smart_spend/widgets/auth_gate.dart';
import 'package:google_api_availability/google_api_availability.dart';


void main() async {
  // Ensure the binding is initialized before Firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  GoogleApiAvailability.instance.makeGooglePlayServicesAvailable();

  // Initialize Firebase with options for the current platform
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app after Firebase is initialized
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Spend',
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child ?? const SizedBox.shrink(),
        );
      },

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthGate(), // Now we just call IntroScreen without passing 'start'
    );
  }
}
