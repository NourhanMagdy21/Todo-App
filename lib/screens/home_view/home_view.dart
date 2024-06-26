import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app1/screens/home_view/widgets/custom_task_widget.dart';

import '../../core/network_layer/firestore_utils.dart';
import '../../core/utils/extract_date.dart';
import '../../model/task_model.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  DateTime selectedDayDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Stack(
          alignment: Alignment(0, 2.5),
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              height: 170,
              width: double.infinity,
              color: theme.primaryColor,
              child: Text(
                "To Do List",
                style: theme.textTheme.titleLarge,
              ),
            ),
            CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              onDateSelected: (date) {
                selectedDayDate = ExtractDate.extractDate(date);
              },
              leftMargin: 20,
              monthColor: Colors.black,
              dayColor: Colors.black,
              activeDayColor: theme.primaryColor,
              activeBackgroundDayColor: Colors.white,
              dotsColor: theme.primaryColor,
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en_ISO',
            ),
          ],
        ),
        SizedBox(
          height: 55,
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirebaseUtiles.getRealTimeDataFromFirebase(selectedDayDate),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.error.toString()),
                    const SizedBox(height: 20),
                    IconButton(
                      onPressed: () {
                        // call api again
                      },
                      icon: Icon(Icons.refresh),
                    ),
                  ],
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryColor,
                  ),
                );
              }

              var tasksList =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

              return ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) =>
                    CustomTaskWidget(taskModel: tasksList[index]),
                itemCount: tasksList.length,
              );
            },
          ),
        )
      ],
    );
  }
}
