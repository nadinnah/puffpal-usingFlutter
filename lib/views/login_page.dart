import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/firestore_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  FirebaseServices firebaseServices = FirebaseServices();

  bool isVisible = false;
  String errorMessage = '';

  InputDecoration fieldDecoration(String hint, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.black54),
      filled: true,
      fillColor: Colors.white60,
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF1E6097)),
        borderRadius: BorderRadius.circular(12),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFD8D0E5),
            Color(0xFFD9DBEF),
            Color(0xFFA8ABCA),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          top: false,
          bottom: true,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 120, 30, 0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 80),
                      Text(
                        "PuffPal Login",
                        style: GoogleFonts.rubikBubbles(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E6097),
                        ),
                      ),
                      SizedBox(height: 80),
          
                      TextFormField(
                        key: Key('custom_email_field'),
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Email is required';
                          if (!value.contains('@') || !value.contains('.'))
                            return 'Invalid email';
                          return null;
                        },
                        decoration: fieldDecoration('Email', Icons.email),
                      ),
          
                      SizedBox(height: 20),
          
                      /// PASSWORD
                      TextFormField(
                        key: Key('custom_password_field'),
                        controller: passwordController,
                        obscureText: !isVisible,
                        validator: (value) =>
                        value!.isEmpty ? 'Password is required' : null,
                        decoration: fieldDecoration('Password', Icons.lock)
                            .copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () =>
                                setState(() => isVisible = !isVisible),
                          ),
                        ),
                      ),
          
                      SizedBox(height: 60),
          
                      /// LOGIN BUTTON
                      ElevatedButton(
                        key: Key('login_button'),
                        onPressed: () async {
                          try {
                            String email = emailController.text.trim();
                            String password = passwordController.text.trim();
          
                            if (formKey.currentState!.validate()) {
                              bool status =
                              await firebaseServices.signIn(email, password);
          
                              if (status) {
                                Navigator.pushReplacementNamed(
                                    context, '/appshell');
                              } else {
                                throw Exception(
                                    'Login failed: Invalid credentials');
                              }
                            }
                          } catch (e) {
                            setState(() => errorMessage = e.toString());
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(errorMessage),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1E6097),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text('Login', style: TextStyle(fontSize: 18)),
                      ),
          
                      SizedBox(height: 20),
          
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/signup'),
                            child: Text("Signup"),
                          ),
                        ],
                      ),
          
                      if (errorMessage.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(errorMessage,
                              style: TextStyle(color: Colors.red)),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
