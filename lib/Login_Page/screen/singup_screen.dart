import 'package:jobstreet/Login_Page/screen/FirebaseAuthService.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:jobstreet/Login_Page/screen/signin_screen.dart';
import 'package:animate_do/animate_do.dart';
import '../../Theme/theme.dart';
import '../widget/customBackground.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuthService _authService = FirebaseAuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final GlobalKey<FormState> _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  String snackBarText = ""; // Variable to hold SnackBar text

  final SizedBox spaceBetween = const SizedBox(height: 15);

  @override
  Widget build(BuildContext context) {
    return customBackgorund(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
               child: Container(
                child: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      spaceBetween,
                      Text(
                        "Join us! ^_^",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color.fromRGBO(0, 51, 102, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ).animate().fadeIn(duration: 2000.ms),
                      spaceBetween,
                      spaceBetween,

                      TextFormField(
                        controller: usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Username";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text("Username"),
                          hintText: "Enter Username",
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      spaceBetween,

                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text("Email"),
                          hintText: "Enter Email",
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      spaceBetween,

                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        obscuringCharacter: "*",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text("Password"),
                          hintText: "Enter Password",
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      spaceBetween,
                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: rememberPassword,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      rememberPassword = value!;
                                    });
                                  },
                                  activeColor: Colors.lightBlue,
                                ),
                                const Text(
                                  "Remember me",
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                )

                              ],
                            ),
                            GestureDetector(
                              //ontap??
                                child: Text(
                                  "Forget password?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: lightColorScheme.primary,
                                  ),
                                )
                            )


                          ],

                        ),
                        spaceBetween,
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formSignInKey.currentState!.validate() && rememberPassword) {
                              try {
                                // Generate a new unique document ID
                                var newDocument = _firestore.collection('users').doc();
                                
                                // Store user data in Cloud Firestore under the newly generated document ID
                                await newDocument.set({
                                  'usersname': usernameController.text,
                                  'email': emailController.text,
                                  'password': passwordController.text,
                                });

                                // Update the snackBarText variable with success message
                                ScaffoldMessenger.of(context).showSnackBar(

                                  SnackBar(
                                    content: Text("Account created successfully!"),
                                    duration: Duration(seconds: 3), // Adjust the duration as needed
                                     ),
                                );

                                // Clear the text fields after successful account creation
                                usernameController.clear();
                                emailController.clear();
                                passwordController.clear();

                                // Set a Timer to clear the success message after 3 seconds (adjust the duration as needed)
                                (Duration(seconds: 3), () {
                                  setState(() {
                                    snackBarText = "";
                                  });
                                });
                              } catch (e) {
                                // Handle error
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Error: $e"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            } else if (!rememberPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please agree to the processing of personal data"),
                                ),
                              );
                            }
                          },
                          child: const Text("Sign Up"),
                        ),
                      ),
                      spaceBetween,
                      spaceBetween,

                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Brand(Brands.google),
                            Brand(Brands.facebook),
                            Brand(Brands.twitter),
                            Brand(Brands.apple_logo),
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        // don't have an account
                        // don't have an account
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account? ',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (e) => const SignInScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: lightColorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
