// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/util/database.dart';
import 'package:spendly/core/widgets/custom_button.dart';
import 'package:spendly/core/widgets/custom_text_field.dart';
import 'package:spendly/pages/home/home_page.dart';

class IntroductionPage extends StatelessWidget {
  IntroductionPage({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Welcome to Spendly App!",
          style: TextStyle(
            fontSize: responsiveFontSize(context, 20),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: responsiveSpacing(context, 28)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor.withOpacity(0.1),
                ),
                child: Icon(
                  Icons.person_outline_rounded,
                  color: primaryColor,
                  size: 70,
                ),
              ),
              SizedBox(height: responsiveSpacing(context, 30)),
              Text(
                "What is your name?",
                style: TextStyle(
                  fontSize: responsiveFontSize(context, 30),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: responsiveSpacing(context, 5)),
              Text(
                "This is the name you will use for your main expense file.",
                style: TextStyle(
                  fontSize: responsiveFontSize(context, 16),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: responsiveSpacing(context, 20)),
              CustomTextField(
                controller: controller,
                hint: "Type your name here..",
                textAlign: TextAlign.center,
                textColor: primaryColor,
              ),
              SizedBox(height: responsiveSpacing(context, 15)),
              CustomButton(
                text: "Confirm",
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Database database = Database();
                  database.saveName(controller.text);
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => HomePage(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: const Duration(milliseconds: 150),
                    ),
                  );
                },
              ),
              SizedBox(height: responsiveSpacing(context, 40)),
            ],
          ),
        ),
      ),
    );
  }
}
