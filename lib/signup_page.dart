import 'package:flutter/material.dart';
import 'package:food_ordering_application/database_helper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () async {

      print("REGISTER DITEKAN");

      try {

        await DatabaseHelper.instance.registerUser(
          emailController.text,
          passwordController.text,
        );

        print("USER BERJAYA DISIMPAN");

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Register Success"),
          ),
        );

      } catch (e) {

        print("ERROR: $e");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("ERROR: $e"),
          ),
        );

      }
    },
    child: const Text("Register"),
  ),
),

          ],
        ),
      ),
    );
  }
}