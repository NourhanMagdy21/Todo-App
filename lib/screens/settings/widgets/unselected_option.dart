import 'package:flutter/material.dart';

class UnSelectedOption extends StatelessWidget {
  final String unSelectedTitle;

  const UnSelectedOption({super.key, required this.unSelectedTitle});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        unSelectedTitle,
        style: theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
      ),
    );
  }
}
