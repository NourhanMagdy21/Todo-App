import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app1/core/widgets/custom_text_form_field.dart';

import '../../model/task_model.dart';
import '../network_layer/firestore_utils.dart';

class BottomSheetWidget extends StatefulWidget {
  BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add New Task",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge!.copyWith(color: Colors.black),
            ),
            CustomTextFormField(
              title: "Enter Your Task Name",
              controller: titleController,
              validator: (String? value) {
                if (value == null || value.trim().isEmpty) {
                  return "you must provide your task title";
                } else if (value.length < 10) {
                  return "your task title must be at least 10 characters";
                } else {
                  return null;
                }
              },
            ),
            CustomTextFormField(
              title: "Enter Your Task description",
              maxLines: 4,
              controller: descriptionController,
              validator: (String? value) {
                if (value == null || value.trim().isEmpty) {
                  return "you must provide your task title";
                } else if (value.length < 10) {
                  return "your task title must be at least 10 characters";
                } else {
                  return null;
                }
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Selected time",
                  style:
                      theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    showCalender(context);
                  },
                  child: Text(
                    DateFormat.yMMMd().format(selectedDate),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: theme.primaryColor),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  var model = TaskModel(
                    title: titleController.text,
                    description: descriptionController.text,
                    dateTime: DateTime.now(),
                    isDone: false,
                  );

                  print("donee");
                  await FirebaseUtiles.addToFirebase(model);
                  Navigator.pop(context);
                  print(titleController.text);
                }
              },
              child: Text(
                "Add Task",
                style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCalender(BuildContext context) async {
    var dateSelected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 356),
      ),
    );

    if (dateSelected == null) return;
    selectedDate = dateSelected;
    setState(() {});
  }
}
