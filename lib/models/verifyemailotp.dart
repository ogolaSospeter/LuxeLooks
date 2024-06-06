import 'package:flutter/material.dart';
import 'package:luxelooks/MainPage.dart';
import 'package:email_otp/email_otp.dart';

class VerifyOtp extends StatefulWidget {
  final String email;
  const VerifyOtp({super.key, required this.email});

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
            onPressed: () {
              if (formKey.currentState!.validate()) {
                //compare the OTP input by the user and the OTP sent to the email
                final otp = _otpControllers.map((e) => e.text).join();
                if (myAuth.verifyOTP()) {
                  //navigate to the next screen
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid OTP. Please try again.'),
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
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  // Logic to resend OTP
                  setState(() {});
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 26,
                ),
              ),
              const SizedBox(width: 30),
              const Text(
                "Resend OTP",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
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
    return '${username.substring(0, 1)}*****@${domain}';
  }

  final firstPart = username.substring(0, 4);
  final lastPart = username.substring(username.length - 2);
  final maskedUsername = '$firstPart*****$lastPart';
  return '$maskedUsername@$domain';
}
