import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/util/database.dart';
import 'package:spendly/core/util/service_locator.dart';
import 'package:spendly/core/widgets/add_profile_dialog.dart';
import 'package:spendly/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:spendly/cubits/home_cubit/home_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> names = getIt.get<Database>().getProfiles();
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              FontAwesomeIcons.wallet,
              size: 60,
            ),
          ),
          Text(
            "Select Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (getIt.get<Database>().selectedName != names[index]) {
                      Navigator.of(context).pop();
                      getIt.get<Database>().setSelectedName(names[index]);
                      BlocProvider.of<HomeCubit>(context).loadProfile();
                      BlocProvider.of<ExpensesCubit>(context).loadExpenses();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 10,
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: primaryColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.user,
                                size: 20,
                                color: Colors.black,
                              ),
                              SizedBox(width: 10),
                              Text(
                                names[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          getIt.get<Database>().selectedName == names[index]
                              ? Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.green,
                                  size: 20,
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (context) => AddProfileDialog(),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Add Profile",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
