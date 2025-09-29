class Student {
  int? id;
  String name;
  int age;
  String course;
  String email;
  String phoneNumber;

  Student({
    this.id,
    required this.name,
    required this.age,
    required this.course,
    required this.email,
    required this.phoneNumber,
  });

  // Convert Student object to Map for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'course': course,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  // Create Student object from Map (retrieved from database)
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      course: map['course'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Student{id: $id, name: $name, age: $age, course: $course, email: $email, phoneNumber: $phoneNumber}';
  }
}
