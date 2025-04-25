// lib/screens/student_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:biodata_siswa/models/student.dart';
import 'package:biodata_siswa/screens/student_form_screen.dart';
import 'package:biodata_siswa/services/firebase_service.dart';

class StudentDetailScreen extends StatelessWidget {
  final Student student;
  final FirebaseService _firebaseService = FirebaseService();

  StudentDetailScreen({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Siswa'),
        actions: [
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
                      onPressed: () async {
                        await _firebaseService.deleteStudent(student.id!);
                        Navigator.of(ctx).pop();
                        Navigator.of(context).pop();
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailItem('Nama', student.name),
                Divider(),
                _buildDetailItem('NIS', student.nis),
                Divider(),
                _buildDetailItem('Kelas', student.className),
                Divider(),
                _buildDetailItem('Alamat', student.address),
                Divider(),
                _buildDetailItem('Nomor Telepon', student.phoneNumber),
                Divider(),
                _buildDetailItem('Email', student.email),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}