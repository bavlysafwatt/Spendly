import 'package:flutter/material.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/pages/goals/widgets/add_goal_dialog_box.dart';
import 'package:spendly/pages/goals/widgets/goals_list_view.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Goals",
          style: TextStyle(
            fontSize: responsiveFontSize(context, 24),
            fontWeight: FontWeight.bold,
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
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: responsiveSpacing(context, 22)),
        child: GoalsListView(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddGoalDialogBox(),
          );
        },
      ),
    );
  }
}
