// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/util/database.dart';
import 'package:spendly/core/util/service_locator.dart';
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
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: responsiveSpacing(context, 28)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: responsiveSpacing(context, 20)),
                        CustomTextField(
                          controller: controller,
                          hint: "Type your name here..",
                          textAlign: TextAlign.center,
                          textColor: primaryColor,
                          maxLength: 10,
                        ),
                        SizedBox(height: responsiveSpacing(context, 15)),
                        CustomButton(
                          text: "Confirm",
                          onTap: () {
                            if (controller.text.isNotEmpty) {
                              FocusScope.of(context).unfocus();
                              getIt.get<Database>().saveName(controller.text);
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (c, a1, a2) => HomePage(),
                                  transitionsBuilder: (c, anim, a2, child) =>
                                      FadeTransition(
                                          opacity: anim, child: child),
                                  transitionDuration:
                                      const Duration(milliseconds: 150),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: responsiveSpacing(context, 40)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
