import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puffpal/l10n/app_localizations.dart';
import '../services/firestore_service.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  String? _selectedGender;

  final formKey = GlobalKey<FormState>();

  bool isVisible = false;
  String errorMessage = '';

  FirebaseServices firebaseServices = FirebaseServices();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    ageController.dispose();
    super.dispose();
  }

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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            localizations.signupTitle,
            style: GoogleFonts.rubikBubbles(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E6097),
            ),
          ),
        ),
        body: SafeArea(
          top: false,
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: fieldDecoration(
                        localizations.nameHint,
                        Icons.person,
                      ),
                      validator: (value) =>
                          value!.isEmpty ? localizations.nameRequired : null,
                    ),
                    const SizedBox(height: 20),

                    TextFormField(
                      controller: phoneController,
                      decoration: fieldDecoration(
                        localizations.phoneHint,
                        Icons.phone,
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return localizations.phoneRequired;
                        }
                        if (value.length != 11) {
                          return localizations.phoneInvalidLength;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: fieldDecoration(
                        localizations.ageHint,
                        Icons.cake,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return localizations.ageRequired;
                        }
                        final int? age = int.tryParse(value);
                        if (age == null || age <= 0 || age > 120) {
                          return localizations.ageInvalid;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      decoration: fieldDecoration(
                        localizations.genderHint,
                        Icons.person_2,
                      ),
                      value: _selectedGender,
                      items: [
                        DropdownMenuItem(
                          value: 'Male',
                          child: Text(localizations.male),
                        ),
                        DropdownMenuItem(
                          value: 'Female',
                          child: Text(localizations.female),
                        ),
                      ],
                      onChanged: (value) => setState(() {
                        _selectedGender = value;
                      }),
                      validator: (value) =>
                          value == null ? localizations.genderRequired : null,
                    ),
                    const SizedBox(height: 20),

                    // EMAIL
                    TextFormField(
                      controller: emailController,
                      decoration: fieldDecoration(
                        localizations.emailHint,
                        Icons.email,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return localizations.emailRequired;
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return localizations.invalidEmail;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // PASSWORD
                    TextFormField(
                      controller: passwordController,
                      obscureText: !isVisible,
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
                      validator: (value) => value!.length < 6
                          ? localizations.passwordTooShort
                          : null,
                    ),
                    const SizedBox(height: 40),

                    // SIGNUP BUTTON
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            bool result = await firebaseServices.signUp(
                              context,
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              nameController.text.trim(),
                              phoneController.text.trim(),
                              int.parse(ageController.text.trim()),
                              _selectedGender!,
                            );

                            if (result) {
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    localizations.signupSuccessAlert,
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            }
                          } catch (e) {
                            setState(() => errorMessage = e.toString());
                          }
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
                        localizations.signupButton,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(localizations.alreadyHaveAccount),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Text(localizations.loginButton),
                        ),
                      ],
                    ),

                    if (errorMessage.isNotEmpty)
                      Text(
                        errorMessage,
                        style: const TextStyle(color: Colors.red),
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
