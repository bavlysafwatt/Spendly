import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/cubits/goal_cubit/goal_cubit.dart';
import 'package:spendly/pages/goals/widgets/color_item.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int selectedIndex = 0;

  final List<int> colors = [
    0xff2196f3,
    0xff4cb050,
    0xfff44236,
    0xff9c28b1,
    0xffff9700,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: responsiveSpacing(context, 8),
          vertical: responsiveSpacing(context, 8)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: colors.asMap().entries.map(
          (entry) {
            int index = entry.key;
            Color colorValue = Color(entry.value);
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    BlocProvider.of<GoalCubit>(context).goalColor =
                        colors[index];
                  });
                },
                child: ColorItem(
                  colorValue: colorValue,
                  isActive: selectedIndex == index,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
