import 'package:flutter/material.dart';

typedef SettingsOptionClicked = void Function();

class SettingsItemWidget extends StatelessWidget {
  final String title;
  final String itemTitle;
  final SettingsOptionClicked onTaped;

  const SettingsItemWidget({
    super.key,
    required this.title,
    required this.itemTitle,
    required this.onTaped,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: onTaped,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              height: 48,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: theme.primaryColor, width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itemTitle,
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.primaryColor,
                      fontSize: 15,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    color: theme.primaryColor,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
