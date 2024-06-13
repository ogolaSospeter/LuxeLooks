import 'package:flutter/material.dart';
import 'package:luxelooks/Login.dart';
import 'package:luxelooks/models/verifyemailotp.dart';
import 'package:email_otp/email_otp.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final EmailOTP myAuth = EmailOTP();
  final List<Widget> _screens = [const LoginPage()];

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> sendOtp() async {
    myAuth.setConfig(
      appEmail: "skylinersystemdevelopers@gmail.com",
      appName: "LuxeLooks Cosmetics",
      userEmail: emailController.text,
      otpLength: 6,
      otpType: OTPType.mixed,
    );
    if (await myAuth.sendOTP()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text("OTP has been sent. The sent otp is valid for 5 minutes")),
      );

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => VerifyOtp(
            email: emailController.text,
            myAuth: myAuth,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Oops, OTP send failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network(
              "https://img.freepik.com/premium-vector/hardware-rsa-token-two-factor-authentication-device_183665-337.jpg?w=740",
            ),
            const Padding(padding: EdgeInsets.symmetric()),
            const Text(
              "Forgot Password?",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 27),
            ),
            const Text(
              'Enter the Account Email to receive the Reset Code.',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(height: 50),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      prefixIcon: Icon(Icons.lock_sharp),
                      labelText: "Enter Email Address",
                      focusedBorder: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Add more validation if needed
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: MaterialButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          sendOtp();
                        }
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
                                  builder: (context) => _screens[0]),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 26,
                          ),
                        ),
                        const SizedBox(width: 30),
                        const Text(
                          "Back To Login",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
