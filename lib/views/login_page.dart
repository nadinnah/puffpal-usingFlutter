import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puffpal/l10n/app_localizations.dart';
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
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF1E6097)),
        borderRadius: BorderRadius.circular(12),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFD8D0E5), Color(0xFFD9DBEF), Color(0xFFA8ABCA)],
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
                      const SizedBox(height: 80),
                      Text(
                        localizations.loginTitle,
                        style: GoogleFonts.rubikBubbles(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E6097),
                        ),
                      ),
                      const SizedBox(height: 80),

                      TextFormField(
                        key: const Key('custom_email_field'),
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return localizations.emailRequired;
                          }
                          if (!value.contains('@') || !value.contains('.')) {
                            return localizations.invalidEmail;
                          }
                          return null;
                        },
                        decoration: fieldDecoration(
                          localizations.emailHint,
                          Icons.email,
                        ),
                      ),

                      const SizedBox(height: 20),

                      TextFormField(
                        key: const Key('custom_password_field'),
                        controller: passwordController,
                        obscureText: !isVisible,
                        validator: (value) => value!.isEmpty
                            ? localizations.passwordRequired
                            : null,
                        decoration:
                            fieldDecoration(
                              localizations.passwordHint,
                              Icons.lock,
                            ).copyWith(
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

                      const SizedBox(height: 60),

                      ElevatedButton(
                        key: const Key('login_button'),
                        onPressed: () async {
                          try {
                            String email = emailController.text.trim();
                            String password = passwordController.text.trim();

                            if (formKey.currentState!.validate()) {
                              bool status = await firebaseServices.signIn(
                                context,
                                email,
                                password,
                              );

                              if (status) {
                                if (!mounted) return;
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/appshell',
                                );
                              } else {
                                throw Exception(
                                  localizations.loginFailedException,
                                );
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
                          backgroundColor: const Color(0xFF1E6097),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          localizations.loginButton,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(localizations.dontHaveAccount),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/signup'),
                            child: Text(localizations.signupButton),
                          ),
                        ],
                      ),

                      if (errorMessage.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            errorMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
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
