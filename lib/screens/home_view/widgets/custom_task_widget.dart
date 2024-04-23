import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../core/network_layer/firestore_utils.dart';
import '../../../model/task_model.dart';

class CustomTaskWidget extends StatelessWidget {
  final TaskModel taskModel;

  const CustomTaskWidget({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFEC4B4B),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              flex: 2,
              onPressed: (context) async {
                await FirebaseUtiles.deleteFromFirebase(taskModel);
              },
              borderRadius: BorderRadius.circular(15),
              backgroundColor: Color(0xFFEC4B4B),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: 400,
          height: 115,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.primaryColor,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.title,
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 5),
                  Text(
                    taskModel.description,
                    style: theme.textTheme.bodyMedium,
                    maxLines: 2,
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.alarm,
                        size: 17,
                      ),
                      SizedBox(width: 4),
                      Text(
                        taskModel.dateTime.toString(),
                        style:
                            theme.textTheme.bodySmall!.copyWith(fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                width: 69,
                height: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.primaryColor,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
