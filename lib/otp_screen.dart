import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'step_info_page.dart';

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ENTER OTP",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFED254E),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Please enter the OTP",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFFED254E),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: PinCodeTextField(
                length: 4,
                obscureText: false,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.grey[300]!,
                  inactiveFillColor: Colors.grey[300]!,
                  selectedFillColor: Colors.white,
                  inactiveColor: Colors.transparent,
                  activeColor: Colors.transparent,
                  selectedColor: Colors.transparent,
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.black,
                enableActiveFill: true,
                onChanged: (value) {},
                appContext: context,
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StepInfoPage(),
                  ),
                );
              },
              child: Container(
                width: 250,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "VERIFY",
                    style: TextStyle(
                      color: Color(0xFFED254E),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                print("Resend OTP clicked!");
              },
              child: Text(
                "Resend OTP",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFED254E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
