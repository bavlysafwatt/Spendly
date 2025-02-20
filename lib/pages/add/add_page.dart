import 'package:flutter/material.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/pages/add/widgets/add_page_body.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "New Expense",
          style: TextStyle(
            fontSize: responsiveFontSize(context, 24),
            fontWeight: FontWeight.w900,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: responsiveSpacing(context, 16)),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            ),
          ),
        ),
      ),
      body: AddPageBody(),
    );
  }
}
