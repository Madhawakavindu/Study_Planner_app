import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_planner/models/course_model.dart';
import 'package:study_planner/services/course_service.dart';
import 'package:study_planner/util/util_functions.dart';
import 'package:study_planner/widgets/custom_button.dart';
import 'package:study_planner/widgets/custom_input.dart';

class AddNewCourse extends StatelessWidget {
  AddNewCourse({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseDescriptionController =
      TextEditingController();
  final TextEditingController _courseDurationController =
      TextEditingController();
  final TextEditingController _courseScheduleController =
      TextEditingController();
  final TextEditingController _courseInstructorController =
      TextEditingController();

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      //save form
      _formKey.currentState?.save();
      //add course to firebase or any other storage here
      try {
        // create a new course
        final Course course = Course(
          id: "",
          name: _courseNameController.text,
          description: _courseDescriptionController.text,
          duration: _courseDurationController.text,
          schedule: _courseScheduleController.text,
          instructor: _courseInstructorController.text,
        );

        await CourseService().createNewCourse(course);

        // Show success SnackBar
        if (context.mounted) {
          showSnackbar(context: context, text: "Course added successfully! ");
        }

        //delay navigation to ensure SnackBar is displayed
        await Future.delayed(const Duration(seconds: 2));

        //Navigate to the home page
        GoRouter.of(context).go("/");
      } catch (error) {
        print(error);
        // Show error SnackBar
        if (context.mounted) {
          showSnackbar(context: context, text: "Failed to add Course!");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add New Course",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                //description
                const Text(
                  'fill in the details below to add a new course.And start manaing your study plan',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 20),
                CustomInput(
                  controller: _courseNameController,
                  lableText: "Course Name",
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter a course name";
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controller: _courseDescriptionController,
                  lableText: "Course Description",
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter a course description";
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controller: _courseDurationController,
                  lableText: "Course Duration",
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter a course duration";
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controller: _courseScheduleController,
                  lableText: "Course Schedule",
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter a course schedule";
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controller: _courseInstructorController,
                  lableText: "Course Instructor",
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please enter a course instructor";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),
                CustomButton(
                  text: "Add Course",
                  onPressed: () => _submitForm(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
