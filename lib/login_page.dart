import 'package:food_ordering_application/signup_page.dart';
import 'package:food_ordering_application/database_helper.dart';
import 'package:food_ordering_application/coloum.dart';
import 'package:flutter/material.dart';
//import 'main.dart'; // tukar ikut nama file HomePage kau

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

 
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        const SizedBox(height: 60),

        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.cyan.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.restaurant_menu,
            size: 80,
            color: Colors.cyan,
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          "UniKL Bistro",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          "Order your favourite meals",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),

        const SizedBox(height: 40),

        TextField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: "Email",
            prefixIcon: const Icon(Icons.email),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),

        const SizedBox(height: 15),

        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            prefixIcon: const Icon(Icons.lock),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),

        const SizedBox(height: 25),

        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () async {

              final success =
                  await DatabaseHelper.instance.loginUser(
                emailController.text,
                passwordController.text,
              );

              if (success) {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ColumnPage(
                      isGuest: false,
                    ),
                  ),
                );

              } else {

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Invalid Email or Password",
                    ),
                  ),
                );

              }
            },
            child: const Text(
              "Login",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),

        const SizedBox(height: 15),

        SizedBox(
          width: double.infinity,
          height: 55,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SignUpPage(),
                ),
              );
            },
            child: const Text("Sign Up"),
          ),
        ),

        const SizedBox(height: 20),

        TextButton.icon(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const ColumnPage(
                  isGuest: true,
                ),
              ),
            );
          },
          icon: const Icon(Icons.person_outline),
          label: const Text("Continue as Guest"),
        ),
      ],
    ),
  ),
),
    );
  }
}