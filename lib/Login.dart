// ignore_for_file: file_names, unused_import, depend_on_referenced_packages, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:luxelooks/MainPage.dart';
import 'package:luxelooks/SignUp.dart';
import 'package:luxelooks/models/Notifications.dart';
import 'package:luxelooks/models/forgot_password.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:status_alert/status_alert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  bool passwordVisible = true;

  String? _emailError;

  String? emailValidator(String value) {
    if (value.isEmpty) {
      return "Please enter your email address";
    } else if (!isEmailValid(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  bool isEmailValid(String email) {
    // Regular expression to validate email addresses
    final RegExp emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.)+[a-zA-Z]{2,}$');

    return emailRegex.hasMatch(email);
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 12, right: 12, top: 80),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                "https://img.freepik.com/free-vector/round-cosmetics-concept_1284-16339.jpg?t=st=1717577367~exp=1717580967~hmac=3d971c534270b8f0141221942bd9c09393e87530f5a5af8eb2ef1ac9e3b6d384&w=740",
                width: 500,
                height: 250,
              ),
              const Text('Welcome Back',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
              Text(
                'Enter your credentials below to continue.',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 23.0),
              Form(
                key: formKey,
                child: Column(children: [
                  TextFormField(
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: true,
                    autofillHints: const [AutofillHints.email],
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      String email = value ??
                          ''; // Assign input email to a string variable
                      String? errorMessage =
                          emailValidator(email); // Validate the email
                      return errorMessage; // Return the error message or null
                    },
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2.0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordcontroller,
                    obscureText: passwordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    enableSuggestions: true,
                    autofillHints: const [AutofillHints.password],
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Error"),
                              content:
                                  const Text("Please enter your password."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );

                        // return "Please enter your password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        borderRadius: BorderRadius.circular(100),
                        child: Icon(
                          passwordVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2.0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ]),
              ),
              const SizedBox(height: 10.0),
              if (_emailError != null)
                AlertDialog(
                  title: const Text("Error"),
                  content: Text(_emailError!),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"),
                    ),
                  ],
                ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const ForgotPassword();
                  }));
                },
                child: const Text(
                  "Forgot Password?",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.deepPurple),
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: 400,
                height: 40,
                child: MaterialButton(
                  onPressed: () async {
                    String email = _emailcontroller.text;
                    String password = _passwordcontroller.text;

                    if (email.isNotEmpty &&
                        password.isNotEmpty &&
                        _emailError == null) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        //use the credential to approve the login
                        if (credential.user == null) {
                          throw FirebaseAuthException(
                              code: 'user-not-found',
                              message: 'No user found for that email.');
                        } else {
                          // Show success dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: const Text("Success"),
                                  content: const Text(
                                      "You have successfully logged in."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("OK"),
                                    ),
                                  ],
                                  icon: const Icon(
                                    Icons.check_circle,
                                    color: Color.fromARGB(255, 1, 92, 4),
                                    size: 70,
                                  ));
                            },
                          );
                          //delay the navigation to show the dialog
                          await Future.delayed(const Duration(seconds: 3));
                          // Navigate to home page
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return const MyHomePage();
                            }),
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        String errorMessage;
                        if (e.code == 'user-not-found') {
                          errorMessage = 'No user found for that email.';
                        } else if (e.code == 'wrong-password') {
                          errorMessage =
                              'Wrong Email or Password provided for that user.';
                        } else {
                          errorMessage = 'Invalid Login! Please try again.';
                        }

                        StatusAlert.show(
                          context,
                          duration: const Duration(seconds: 2),
                          title: 'Error!',
                          margin: const EdgeInsets.all(70),
                          backgroundColor: Colors.grey[300]!,
                          subtitle: errorMessage,
                          configuration: const IconConfiguration(
                              icon: Icons.error,
                              size: 50,
                              color: Colors.redAccent),
                          dismissOnBackgroundTap: true,
                        );
                      }
                    } else {
                      if (password.isEmpty || email.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Error"),
                              content: const Text("Fields Cannot be Empty."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                              icon: const Icon(Icons.error,
                                  color: Colors.red, size: 50),
                            );
                          },
                        );
                      }
                    }
                  },
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Text("Sign In"),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  MouseRegion(
                    onHover: (event) {
                      // Handle tooltip display here
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const SignUpPage();
                          }),
                        );
                      },
                      child: const Tooltip(
                        message: "Go to the sign-up.",
                        waitDuration: Duration(seconds: 1),
                        showDuration: Duration(seconds: 2),
                        preferBelow: true,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Color.fromARGB(255, 92, 4, 243),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
