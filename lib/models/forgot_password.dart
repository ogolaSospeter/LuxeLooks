import 'package:flutter/material.dart';
import 'package:luxelooks/Login.dart';
import 'package:luxelooks/models/verifyemailotp.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

final List<Widget> _screens = [const VerifyOtp(), const LoginPage()];

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.network(
                  "https://img.freepik.com/premium-vector/hardware-rsa-token-two-factor-authentication-device_183665-337.jpg?w=740"),
              const Padding(padding: EdgeInsets.symmetric()),
              const Text(
                "Forgot Password?",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 27),
              ),
              const Text('Enter the Account Email to receive the Reset Code.',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              const SizedBox(height: 50),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailcontroller,
                        decoration: const InputDecoration(
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          prefixIcon: Icon(Icons.lock_sharp),
                          label: Text("Enter Email Address."),
                          focusedBorder: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 400,
                        height: 50,
                        child: MaterialButton(
                          color: Colors.blueAccent,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return _screens[0];
                              }),
                            );
                          },
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Text(
                            'Send OTP Code',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 40,
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return _screens[1];
                                    }),
                                  );
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 26,
                                )),
                            const SizedBox(width: 30),
                            const Text(
                              "Back To Login",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
