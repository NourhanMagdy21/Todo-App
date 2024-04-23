import 'package:flutter/material.dart';

class SelectedOption extends StatelessWidget {
  final String selectedTitle;

  const SelectedOption({super.key, required this.selectedTitle});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectedTitle,
            style: theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
          ),
          Icon(Icons.check)
        ],
      ),
    );
  }
}
