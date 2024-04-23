import 'package:flutter/material.dart';
import 'package:todo_app1/screens/settings/widgets/language_bottom_sheet.dart';
import 'package:todo_app1/screens/settings/widgets/settings_item.dart';
import 'package:todo_app1/screens/settings/widgets/theme_bottom_sheet_widget.dart';


class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 160,
          color: theme.primaryColor,
          child: Text(
            "Settings",
            style: theme.textTheme.titleLarge,
          ),
        ),
        SettingsItemWidget(
          title: "Languages",
          itemTitle: "English",
          onTaped: () {
            showLanguageBottomSheet(context);
          },
        ),
        SettingsItemWidget(
          title: "Theme",
          itemTitle: "Light",
          onTaped: () {
            showThemeBottomSheet(context);
          },
        ),
      ],
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (context) => LanguageBottomSheetWidget(),
    );
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (context) => ThemeBottomSheetWidget(),
    );
  }
}
