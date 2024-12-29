import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joke_app/screens/home_screen.dart';
import 'package:joke_app/widgets/custom_app_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = '';
  String password = '';

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool isValidEmail(String email) {
    RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
      caseSensitive: false,
    );

    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Login",
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffaa076b), Color(0xff61045f)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        height: double.maxFinite,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white, 
                        width: 1.5
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white, 
                        width: 1.5
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white, 
                        width: 1.5
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white, 
                        width: 1.5
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white, 
                        width: 1.5
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusColor: Colors.white, 
                    labelText: "Email", 
                    labelStyle: const TextStyle(color: Colors.white),
                    hintText: "Enter Email",
                    hintStyle: const TextStyle(color: Colors.white),
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!isValidEmail(value)) {
                      return 'Email not valid!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white, 
                        width: 1.5
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white, 
                        width: 1.5
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white, 
                        width: 1.5
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white, 
                        width: 1.5
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white, 
                        width: 1.5
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusColor: Colors.white, 
                    labelText: "Password", 
                    labelStyle: const TextStyle(color: Colors.white),
                    hintText: "Enter Password",
                    hintStyle: const TextStyle(color: Colors.white),
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password should not have less than 6 characters.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.check_circle_outline_sharp, color: Color(0xff61045f),),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text.trim(), 
                            password: passwordController.text.trim(),
                          );
                          if(context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Login successful!', 
                                  style: TextStyle(color: Colors.green),
                                ),
                                backgroundColor: Colors.white,
                              )
                            );
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
                          }
                        } catch (e) {
                          if(context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Login failed: ${e.toString()}', 
                                  style: const TextStyle(color: Colors.red),
                                ),
                                backgroundColor: Colors.white,  
                              ),
                            );
                          }
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Please fill input', 
                              style: TextStyle(color: Colors.red),
                            ),
                            backgroundColor: Colors.white,  
                          ),
                        );
                      }
                    },
                    label: const Text('Login', style: TextStyle(color: Color(0xff61045f)),),
                  ),
                ),
              ),
            ],),
          ),
        ),
      ),
    );
  }
}
