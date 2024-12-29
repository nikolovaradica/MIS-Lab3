import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joke_app/screens/login_screen.dart';
import 'package:joke_app/widgets/custom_app_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String email = '';
  String password = '';
  String name = '';
  String phone = '';

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
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
        title: "Register",
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
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //name
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        controller: nameController,
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
                          focusColor: Colors.white, 
                          labelText: "Name", 
                          labelStyle: const TextStyle(color: Colors.white),
                          hintText: "Enter Name",
                          hintStyle: const TextStyle(color: Colors.white),
                        ),
                        style: const TextStyle(color: Colors.white),                                                             
                      ),
                    ),
                    //email
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
                    //password
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
                    //phone
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        controller: phoneController,
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
                          focusColor: Colors.white, 
                          labelText: "Phone", 
                          labelStyle: const TextStyle(color: Colors.white),
                          hintText: "Enter Phone",
                          hintStyle: const TextStyle(color: Colors.white),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                      child: Center(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.check_circle_outline_sharp, color: Color(0xff61045f),),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                log("In try blick before create user");
                                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: emailController.text.trim(), 
                                  password: passwordController.text.trim()
                                );
                                log("after create user");
                                if(context.mounted) {
                                  log("in context mounted");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Registration successful!', 
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      backgroundColor: Colors.white,
                                    )
                                  );
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
                                }
                              } catch (e) {
                                log("in catch block");
                                if(context.mounted) {
                                  log("in catch mounted bblock");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Registration failed: ${e.toString()}', 
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
                          label: const Text(
                            'Register', 
                            style: TextStyle(color: Color(0xff61045f)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
