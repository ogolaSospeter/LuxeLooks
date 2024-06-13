import 'package:flutter/material.dart';
import 'package:luxelooks/Login.dart';
import 'package:luxelooks/MainPage.dart';
import 'package:email_otp/email_otp.dart';
import 'package:luxelooks/SignUp.dart';
import 'package:luxelooks/models/forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyOtp extends StatefulWidget {
  final String email;
  final EmailOTP myAuth;
  const VerifyOtp({super.key, required this.email, required this.myAuth});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  EmailOTP myAuth = EmailOTP();

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildOTPSentCard()],
        ),
      ),
    );
  }

  Widget _buildOTPSentCard() {
    final maskedEmail = maskEmail(widget.email);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
            "https://img.freepik.com/free-vector/hands-women-holding-skin-care-products-bottles-with-serum-lotion-cream-flat-vector-illustration-cosmetics-beauty-treatment-concept-banner-website-design-landing-web-page_74855-24834.jpg?t=st=1717573023~exp=1717576623~hmac=ef48ea15218976051379c7072fc0e84d87d5f861f5248e5ea7943df9c03dada4&w=740"),
        const SizedBox(height: 20),
        Text(
          'An OTP Code has been sent to $maskedEmail with a link to verify your account. If you have not received the email in a few minutes, please check your spam/junk folder.',
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        _buildOtpInputFields(),
        const SizedBox(height: 30),
        SizedBox(
          width: 300,
          height: 50,
          child: MaterialButton(
            color: Colors.blueAccent,
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                //compare the OTP input by the user and the OTP sent to the email
                var userOtp = _otpControllers.map((e) => e.text).join();
                if (await widget.myAuth.verifyOTP(otp: userOtp)) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Success'),
                      content: const Text('OTP has been verified successfully'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ResetPassword(email: widget.email)),
                            );
                          },
                          child: const Text('OK'),
                        ),
                        const Icon(
                          Icons.check,
                          color: Color.fromARGB(255, 0, 90, 3),
                          size: 50,
                        )
                      ],
                    ),
                  );
                  await Future.delayed(const Duration(seconds: 2));
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>
                            ResetPassword(email: widget.email)),
                  );
                  //navigate to the next screen
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(builder: (context) => const MyHomePage()),
                  // );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Invalid OTP. Please try again. If you have not received the email, click on Resend OTP.'),
                    ),
                  );
                }
                // Logic to verify OTP
              }
            },
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text(
              'Verify OTP',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 40,
          width: 200,
          child: MaterialButton(
            color: Color.fromARGB(255, 101, 151, 238),
            onPressed: () {
              // Logic to resend OTP
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const ForgotPassword()),
              );
            },
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text(
              "Resend OTP",
              style: TextStyle(color: Color.fromARGB(255, 219, 4, 22)),
            ),
          ),
        ),
        const SizedBox(width: 30),
      ],
    );
  }

  Widget _buildOtpInputFields() {
    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(6, (index) {
          return _buildOtpTextField(index);
        }),
      ),
    );
  }

  Widget _buildOtpTextField(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 40,
      child: TextFormField(
        controller: _otpControllers[index],
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          counterText: '',
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 1 && index < 5) {
            FocusScope.of(context).nextFocus();
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
      ),
    );
  }
}

String maskEmail(String email) {
  final emailParts = email.split('@');
  final username = emailParts[0];
  final domain = emailParts[1];

  if (username.length <= 6) {
    return '${username.substring(0, 1)}******@${domain}';
  }

  final firstPart = username.substring(0, 4);
  final lastPart = username.substring(username.length - 2);
  final maskedUsername = '$firstPart******$lastPart';
  return '$maskedUsername@$domain';
}

//Create the card that'll allow for the reset of the password
enum AuthStatus {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
}

class ResetPassword extends StatefulWidget {
  final String email;

  const ResetPassword({Key? key, required this.email}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  AuthStatus _status = AuthStatus.unknown;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  "https://img.freepik.com/free-vector/hands-women-holding-skin-care-products-bottles-with-serum-lotion-cream-flat-vector-illustration-cosmetics-beauty-treatment-concept-banner-website-design-landing-web-page_74855-24834.jpg?t=st=1717573023~exp=1717576623~hmac=ef48ea15218976051379c7072fc0e84d87d5f861f5248e5ea7943df9c03dada4&w=740"),
              const SizedBox(height: 20),
              const Text(
                'Reset Password',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 27),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'New Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        if (CheckPasswordStrength(value) == 0) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Password Strength'),
                                  content: const Text(
                                      'Password must contain at least one uppercase letter, one lowercase letter, one number and one special character'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                  icon: const Icon(
                                    Icons.warning,
                                    color: Colors.red,
                                  ),
                                );
                              });
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: MaterialButton(
                        color: Colors.blueAccent,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              User? user = _auth.currentUser;
                              if (user != null) {
                                await user
                                    .updatePassword(_passwordController.text);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Password reset successful')),
                                );
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              }
                            } on FirebaseAuthException catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        e.message ?? 'Password reset failed')),
                              );
                            }
                          }
                        },
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Text(
                          'Reset Password',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthExceptionHandler {
  static handleAuthException(FirebaseAuthException e) {
    AuthStatus status;
    switch (e.code) {
      case "invalid-email":
        status = AuthStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthStatus.wrongPassword;
        break;
      case "weak-password":
        status = AuthStatus.weakPassword;
        break;
      case "email-already-in-use":
        status = AuthStatus.emailAlreadyExists;
        break;
      default:
        status = AuthStatus.unknown;
    }
    return status;
  }

  static String generateErrorMessage(error) {
    String errorMessage;
    switch (error) {
      case AuthStatus.invalidEmail:
        errorMessage = "Your email address appears to be malformed.";
        break;
      case AuthStatus.weakPassword:
        errorMessage = "Your password should be at least 6 characters.";
        break;
      case AuthStatus.wrongPassword:
        errorMessage = "Your email or password is wrong.";
        break;
      case AuthStatus.emailAlreadyExists:
        errorMessage =
            "The email address is already in use by another account.";
        break;
      default:
        errorMessage = "An error occured. Please try again later.";
    }
    return errorMessage;
  }
}
