// lib/screens/student_form_screen.dart
import 'package:flutter/material.dart';
import 'package:biodata_siswa/models/student.dart';
import 'package:biodata_siswa/services/firebase_service.dart';

class StudentFormScreen extends StatefulWidget {
  final Student? student;

  StudentFormScreen({this.student});

  @override
  _StudentFormScreenState createState() => _StudentFormScreenState();
}

class _StudentFormScreenState extends State<StudentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseService _firebaseService = FirebaseService();

  late TextEditingController _nameController;
  late TextEditingController _nisController;
  late TextEditingController _classController;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  bool _isEdit = false;

  @override
  void initState() {
    super.initState();
    _isEdit = widget.student != null;
    _nameController = TextEditingController(text: widget.student?.name ?? '');
    _nisController = TextEditingController(text: widget.student?.nis ?? '');
    _classController = TextEditingController(text: widget.student?.className ?? '');
    _addressController = TextEditingController(text: widget.student?.address ?? '');
    _phoneController = TextEditingController(text: widget.student?.phoneNumber ?? '');
    _emailController = TextEditingController(text: widget.student?.email ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nisController.dispose();
    _classController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _saveStudent() async {
    if (_formKey.currentState!.validate()) {
      Student student = Student(
        id: _isEdit ? widget.student!.id : null,
        name: _nameController.text,
        nis: _nisController.text,
        className: _classController.text,
        address: _addressController.text,
        phoneNumber: _phoneController.text,
        email: _emailController.text,
      );

      try {
        if (_isEdit) {
          await _firebaseService.updateStudent(student);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data siswa berhasil diperbarui')),
          );
        } else {
          await _firebaseService.addStudent(student);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data siswa berhasil ditambahkan')),
          );
        }
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Terjadi kesalahan: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'Edit Data Siswa' : 'Tambah Data Siswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nama Lengkap'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _nisController,
                  decoration: InputDecoration(labelText: 'NIS'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'NIS tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _classController,
                  decoration: InputDecoration(labelText: 'Kelas'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kelas tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Alamat'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Nomor Telepon'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor telepon tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!value.contains('@')) {
                      return 'Email tidak valid';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveStudent,
                  child: Text(_isEdit ? 'Update' : 'Simpan'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}