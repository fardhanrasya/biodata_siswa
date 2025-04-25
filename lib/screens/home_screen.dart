// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:biodata_siswa/models/student.dart';
import 'package:biodata_siswa/services/firebase_service.dart';
import 'package:biodata_siswa/screens/student_form_screen.dart';
import 'package:biodata_siswa/screens/student_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata Siswa'),
      ),
      body: StreamBuilder<List<Student>>(
        stream: _firebaseService.getStudents(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          List<Student> students = snapshot.data ?? [];

          if (students.isEmpty) {
            return Center(child: Text('Belum ada data siswa'));
          }

          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              Student student = students[index];
              return ListTile(
                title: Text(student.name),
                subtitle: Text('NIS: ${student.nis} - Kelas: ${student.className}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentFormScreen(student: student),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Konfirmasi Hapus'),
                            content: Text('Yakin ingin menghapus data ${student.name}?'),
                            actions: [
                              TextButton(
                                child: Text('Batal'),
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Hapus'),
                                onPressed: () {
                                  _firebaseService.deleteStudent(student.id!);
                                  Navigator.of(ctx).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Data siswa berhasil dihapus')),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentDetailScreen(student: student),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentFormScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}