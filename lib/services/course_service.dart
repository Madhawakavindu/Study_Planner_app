import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_planner/models/course_model.dart';

class CourseService {
  //create the firestore collection reference
  final CollectionReference courseCollection = FirebaseFirestore.instance
      .collection("courses");

  //add new course
  Future<void> createNewCourse(Course course) async {
    try {
      // convert the course object to a map
      final Map<String, dynamic> data = course.toJson();

      //add the course to the collection
      final DocumentReference docRef = await courseCollection.add(data);

      //update the course document with the generated id
      await docRef.update({'id': docRef.id});

      print("course saved");
    } catch (error) {
      print('Error creating course: $error');
    }
  }

  // get all courses as a stream list of Course
  Stream<List<Course>> get courses {
    try {
      return courseCollection.snapshots().map((snapshot) {
        return snapshot.docs
            .map((doc) => Course.fromJSON(doc.data() as Map<String, dynamic>))
            .toList();
      });
    } catch (error) {
      print(error);
      return Stream.empty();
    }
  }
}
