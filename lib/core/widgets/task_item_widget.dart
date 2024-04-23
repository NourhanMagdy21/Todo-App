import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../model/task_model.dart';

class TaskItemWigdet extends StatelessWidget {
  const TaskItemWigdet({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.red,
      ),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: (context) {},
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: 120,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 5,
                height: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: theme.primaryColor),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    taskModel.title,
                    style: theme.textTheme.bodyMedium,
                  ),
                  Text(
                    taskModel.description,
                    style: theme.textTheme.bodySmall,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text(
                        taskModel.dateTime.toString(),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset("asset/images/Icon awesome-check.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
