import 'package:flutter/material.dart';
import 'package:todo_app1/core/widgets/bottom_sheet_widget.dart';
import 'package:todo_app1/screens/home_view/home_view.dart';
import 'package:todo_app1/screens/settings/settings_view.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home_layout";

  HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedtIndex = 0;
  List<Widget> Pages = [
    HomeView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          padding: EdgeInsets.all(6),
          child: FloatingActionButton(
            onPressed: () {
              showAddTaskBottomSheet(context);
            },
            child: Icon(
              Icons.add,
              size: 28,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      body: Pages[selectedtIndex],
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(
            currentIndex: selectedtIndex,
            onTap: (value) {
              selectedtIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings")
            ],
          )),
    );
  }

  void showAddTaskBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        builder: (context) => BottomSheetWidget());
  }
}
