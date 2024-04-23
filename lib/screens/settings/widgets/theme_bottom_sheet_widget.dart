import 'package:flutter/material.dart';
import 'package:todo_app1/screens/settings/widgets/selected_option.dart';
import 'package:todo_app1/screens/settings/widgets/unselected_option.dart';

class ThemeBottomSheetWidget extends StatelessWidget {
  const ThemeBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectedOption(selectedTitle: "Light"),
          SizedBox(height: 20),
          UnSelectedOption(unSelectedTitle: "Dark")
        ],
      ),
    );
    ;
  }
}
