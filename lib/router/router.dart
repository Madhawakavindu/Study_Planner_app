import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_planner/models/course_model.dart';
import 'package:study_planner/pages/add_new_course.dart';
import 'package:study_planner/pages/home_page.dart';
import 'package:study_planner/pages/main_screens/add_new_assignment.dart';
import 'package:study_planner/pages/main_screens/add_new_note.dart';
import 'package:study_planner/pages/single_course_page.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    errorPageBuilder: (context, state) {
      return const MaterialPage(
        child: Scaffold(body: Center(child: Text("This page is available!"))),
      );
    },
    routes: [
      //homepage
      GoRoute(
        path: "/",
        name: "home",
        builder: (context, state) {
          return HomePage();
        },
      ),
      //add new course page
      GoRoute(
        path: "/add-new-course",
        name: "add new course",
        builder: (context, state) {
          return AddNewCourse();
        },
      ),
      //Single course
      GoRoute(
        path: "/single-course",
        name: "single course",
        builder: (context, state) {
          final Course course = state.extra as Course;
          return SingleCoursePage(course: course);
        },
      ),
      // add new assignment
      GoRoute(
        path: "/add-new-assignment",
        name: "add new assignment",
        builder: (context, state) {
          final Course course = state.extra as Course;
          return AddNewAssignment(course: course);
        },
      ),
      //add new note
      GoRoute(
        path: "/add-new-note",
        name: "add new note",
        builder: (context, state) {
          final Course course = state.extra as Course;
          return AddNewNote(course: course);
        },
      ),
    ],
  );
}
