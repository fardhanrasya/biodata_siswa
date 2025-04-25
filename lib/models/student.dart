// lib/models/student.dart
class Student {
  final String? id;
  final String name;
  final String nis;
  final String className;
  final String address;
  final String phoneNumber;
  final String email;

  Student({
    this.id,
    required this.name,
    required this.nis,
    required this.className,
    required this.address,
    required this.phoneNumber,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nis': nis,
      'className': className,
      'address': address,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map, String id) {
    return Student(
      id: id,
      name: map['name'] ?? '',
      nis: map['nis'] ?? '',
      className: map['className'] ?? '',
      address: map['address'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'] ?? '',
    );
  }
}