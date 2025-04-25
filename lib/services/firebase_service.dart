// lib/services/firebase_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:biodata_siswa/models/student.dart';

class FirebaseService {
  final CollectionReference studentsCollection = 
      FirebaseFirestore.instance.collection('students');

  // Create a new student
  Future<void> addStudent(Student student) async {
    await studentsCollection.add(student.toMap());
  }

  // Read all students
  Stream<List<Student>> getStudents() {
    return studentsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Student.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // Read a single student
  Future<Student?> getStudent(String id) async {
    DocumentSnapshot doc = await studentsCollection.doc(id).get();
    if (doc.exists) {
      return Student.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }
    return null;
  }

  // Update a student
  Future<void> updateStudent(Student student) async {
    await studentsCollection.doc(student.id).update(student.toMap());
  }

  // Delete a student
  Future<void> deleteStudent(String id) async {
    await studentsCollection.doc(id).delete();
  }
}