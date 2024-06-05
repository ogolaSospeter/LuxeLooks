import 'package:flutter/material.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  TextEditingController _emailcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildOTPSentCard()],
        ),
        color: Colors.white,
      ),
    );
  }

  // Widget _buildEnterEmailCard() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Image.network(
  //           "https://img.freepik.com/free-vector/hands-women-holding-skin-care-products-bottles-with-serum-lotion-cream-flat-vector-illustration-cosmetics-beauty-treatment-concept-banner-website-design-landing-web-page_74855-24834.jpg?t=st=1717573023~exp=1717576623~hmac=ef48ea15218976051379c7072fc0e84d87d5f861f5248e5ea7943df9c03dada4&w=740"),
  //       Padding(padding: EdgeInsets.only(top: 20)),
  //       Text(
  //         'Enter the Email to receive the OTP Code.',
  //         style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
  //       ),
  //       SizedBox(height: 50),
  //       Form(
  //         key: formKey,
  //         child: Column(
  //           children: [
  //             TextFormField(
  //               controller: _emailcontroller,
  //               decoration: InputDecoration(
  //                 floatingLabelAlignment: FloatingLabelAlignment.start,
  //                 prefixIcon: Icon(Icons.lock_sharp),
  //                 labelText: "Enter Email Address",
  //                 focusedBorder: OutlineInputBorder(),
  //               ),
  //               keyboardType: TextInputType.emailAddress,
  //               validator: (value) {
  //                 String email = value ?? '';
  //                 if (email.isEmpty) {
  //                   return 'Please enter your email address';
  //                 }
  //                 // Add additional email validation if needed
  //                 return null;
  //               },
  //             ),
  //             SizedBox(height: 30),
  //             SizedBox(
  //               width: 400,
  //               height: 50,
  //               child: MaterialButton(
  //                 color: Colors.blueAccent,
  //                 onPressed: () {
  //                   if (formKey.currentState!.validate()) {
  //                     // Resend OTP logic goes here
  //                   }
  //                 },
  //                 child: Text(
  //                   'Resend OTP Code',
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //                 clipBehavior: Clip.antiAliasWithSaveLayer,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(10.0),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: 15),
  //             SizedBox(
  //               width: 300,
  //               height: 50,
  //               child: MaterialButton(
  //                 color: const Color.fromARGB(255, 100, 153, 245),
  //                 onPressed: () {
  //                   setState(() {
  //                     _isOTPSent = true;
  //                   });
  //                 },
  //                 child: Text(
  //                   "Enter OTP Code",
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //                 clipBehavior: Clip.antiAliasWithSaveLayer,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(10.0),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: 20),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildOTPSentCard() {
    const email = "skylinersystemdevelopers@gmail.com";
    final maskedEmail = maskEmail(email);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
            "https://img.freepik.com/free-vector/hands-women-holding-skin-care-products-bottles-with-serum-lotion-cream-flat-vector-illustration-cosmetics-beauty-treatment-concept-banner-website-design-landing-web-page_74855-24834.jpg?t=st=1717573023~exp=1717576623~hmac=ef48ea15218976051379c7072fc0e84d87d5f861f5248e5ea7943df9c03dada4&w=740"),
        const Padding(padding: EdgeInsets.only(top: 20)),
        Text(
          'An OTP Code has been sent to $maskedEmail with a link to verify your account. If you have not received the email in a few minutes, please check your spam/junk folder.',
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OTPWidget(digit: "*"),
            OTPWidget(digit: "*"),
            OTPWidget(digit: "*"),
            OTPWidget(digit: "*"),
            OTPWidget(digit: "*")
          ],
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: 300,
          height: 50,
          child: MaterialButton(
            color: Colors.blueAccent,
            onPressed: () {
              // Validate OTP logic goes here
              setState(() {});
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
                  setState(() {
                    // _isOTPSent = false;
                  });
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
}

class OTPWidget extends StatelessWidget {
  final String digit;

  const OTPWidget({super.key, required this.digit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 57,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          digit,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          selectionColor: Colors.deepOrangeAccent,
        ),
      ),
    );
  }
}

String maskEmail(String email) {
  final emailParts = email.split('@');
  final username = emailParts[0];
  final domain = emailParts[1];

  if (username.length <= 6) {
    // If the username is too short to mask effectively, just show the first character and mask the rest
    return '${username.substring(0, 1)}*****@${domain}';
  }

  final firstPart = username.substring(0, 4);
  final lastPart = username.substring(username.length - 2);
  final maskedUsername = '$firstPart*****$lastPart';
  final maskedEmail = '$maskedUsername@$domain';

  return maskedEmail;
}




// import 'package:flutter/material.dart';

// class VerifyOtp extends StatefulWidget {
//   const VerifyOtp({super.key});

//   @override
//   State<VerifyOtp> createState() => _VerifyOtpState();
// }

// class _VerifyOtpState extends State<VerifyOtp> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _emailcontroller = TextEditingController();

//     final formKey = GlobalKey<FormState>();

//     return Container(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.only(top: 40, left: 15, right: 15),
//             child: Column(
//               children: [
//                 Image.asset('images/send_email.jpg'),
//                 Padding(padding: EdgeInsets.only(top: 20)),
//                 Text(
//                   "Verify OTP",
//                   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 27),
//                 ),
//                 Text(
//                   'An OTP Code has been sent to skylinersystemdevelopers@gmail.com with a link to verify your account. If you have not received the email in a few minutes, please check your spam/junk folder.',
//                   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 50),
//                 Form(
//                   key: formKey,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: _emailcontroller,
//                         decoration: InputDecoration(
//                           floatingLabelAlignment: FloatingLabelAlignment.start,
//                           prefixIcon: Icon(Icons.lock_sharp),
//                           label: Text("Enter Email Address."),
//                           focusedBorder: OutlineInputBorder(),
//                         ),
//                         keyboardType: TextInputType.emailAddress,
//                       ),
//                       SizedBox(height: 30),
//                       SizedBox(
//                         width: 400,
//                         height: 50,
//                         child: MaterialButton(
//                           color: Colors.blueAccent,
//                           onPressed: () {},
//                           child: Text(
//                             'Resend OTP Code',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       SizedBox(
//                         width: 300,
//                         height: 50,
//                         child: MaterialButton(
//                           color: const Color.fromARGB(255, 100, 153, 245),
//                           onPressed: () {},
//                           child: Text(
//                             "Enter OTP Code",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
