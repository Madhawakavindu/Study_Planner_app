import 'package:flutter/material.dart';
import 'package:study_planner/constants/colors.dart';
import 'package:study_planner/pages/main_screens/assignments_page.dart';
import 'package:study_planner/pages/main_screens/courses_page.dart';
import 'package:study_planner/pages/main_screens/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = [
    MainPage(),
    CoursesPage(),
    AssignmentsPage(),
  ];

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapItem,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Courses"),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment_rounded),
            label: "Assignments",
          ),
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

      body: Center(child: _pages.elementAt(_selectedIndex)),
    );
  }
}
