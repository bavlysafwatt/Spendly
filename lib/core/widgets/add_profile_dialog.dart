import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/util/database.dart';
import 'package:spendly/core/util/functions/show_snack_bar.dart';
import 'package:spendly/core/util/service_locator.dart';
import 'package:spendly/core/widgets/custom_text_field.dart';
import 'package:spendly/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:spendly/cubits/home_cubit/home_cubit.dart';

class AddProfileDialog extends StatelessWidget {
  AddProfileDialog({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      backgroundColor: Colors.white,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add new profile",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: responsiveSpacing(context, 10)),
          CustomTextField(
              controller: controller, hint: "Profile name..", maxLength: 10),
          SizedBox(height: responsiveSpacing(context, 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  final database = getIt.get<Database>();
                  List<String> existingProfiles = database.getProfiles();
                  if (controller.text.isEmpty) {
                    showSnackBar(
                      context,
                      "Profile name cannot be empty!",
                      Colors.red,
                    );
                  } else if (existingProfiles.contains(controller.text)) {
                    showSnackBar(
                      context,
                      "Profile name already exists!",
                      Colors.red,
                    );
                  } else {
                    Navigator.of(context).pop();
                    database.saveName(controller.text);
                    BlocProvider.of<HomeCubit>(context).loadProfile();
                    BlocProvider.of<ExpensesCubit>(context).loadExpenses();
                  }
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
