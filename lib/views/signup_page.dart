import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/firestore_service.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Sign Up',style: GoogleFonts.rubikBubbles(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E6097),
          ),
        )),
        body: SafeArea(
          top: false,
          bottom: true,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // NAME
                    TextFormField(
                      controller: nameController,
                      decoration: fieldDecoration('Name', Icons.person),
                      validator: (value) =>
                      value!.isEmpty ? 'Name is required' : null,
                    ),
                    SizedBox(height: 20),
          
                    // PHONE
                    TextFormField(
                      controller: phoneController,
                      decoration:
                      fieldDecoration('Phone Number', Icons.phone),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Phone number is required';
                        if (value.length != 11)
                          return 'Phone number must be exactly 11 digits';
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
          
                    // AGE
                    TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: fieldDecoration('Age', Icons.cake),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Please enter your age';
                        final int? age = int.tryParse(value);
                        if (age == null || age <= 0 || age > 120)
                          return 'Enter a valid age (1-120)';
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
          
                    // GENDER
                    DropdownButtonFormField<String>(
                      decoration: fieldDecoration('Gender', Icons.person_2),
                      value: _selectedGender,
                      items: ['Male', 'Female'].map((String gender) {
                        return DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() {
                        _selectedGender = value;
                      }),
                      validator: (value) =>
                      value == null ? 'Please select your gender' : null,
                    ),
                    SizedBox(height: 20),
          
                    // EMAIL
                    TextFormField(
                      controller: emailController,
                      decoration: fieldDecoration('Email', Icons.email),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Email is required';
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) return 'Invalid email format';
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
          
                    // PASSWORD
                    TextFormField(
                      controller: passwordController,
                      obscureText: !isVisible,
                      decoration: fieldDecoration('Password', Icons.lock).copyWith(
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
                      validator: (value) =>
                      value!.length < 6 ? 'Minimum 6 characters' : null,
                    ),
                    SizedBox(height: 40),
          
                    // SIGNUP BUTTON
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            bool result = await firebaseServices.signUp(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              nameController.text.trim(),
                              phoneController.text.trim(),
                              int.parse(ageController.text.trim()),
                              _selectedGender!,
                            );
          
                            if (result) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Sign-up successful! Please login.'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            }
                          } catch (e) {
                            setState(() => errorMessage = e.toString());
                          }
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
                      child: Text('Sign Up', style: TextStyle(fontSize: 18)),
                    ),
          
                    SizedBox(height: 15),
          
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Text("Login"),
                        ),
                      ],
                    ),
          
                    if (errorMessage.isNotEmpty)
                      Text(errorMessage, style: TextStyle(color: Colors.red)),
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
