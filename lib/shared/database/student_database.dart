import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Step 4: Define the data model
class Student {
  final int? id;
  final String name;
  final int age;
  final String grade;

  Student(
      {this.id, required this.name, required this.age, required this.grade});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'grade': grade,
    };
  }
}

class StudentDatabase {
  Future<Database> initializeDatabase() async {
    final String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'student_database.db'),
      version: 1,
      onCreate: (Database db, int version) {
        return db.execute(
          'CREATE TABLE students(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, grade TEXT)',
        );
      },
    );
  }

  Future<int> insertStudent(Student student) async {
    final Database db = await initializeDatabase();

    return db.insert('students', student.toMap());
  }

  Future<List<Student>> retrieveStudents() async {
    final Database db = await initializeDatabase();
    final List<Map<String, dynamic>> maps = await db.query('students');
    return List.generate(maps.length, (index) {
      return Student(
        id: maps[index]['id'],
        name: maps[index]['name'],
        age: maps[index]['age'],
        grade: maps[index]['grade'],
      );
    });
  }

  Future<int> updateStudent(Student student) async {
    final Database db = await initializeDatabase();
    return db.update(
      'students',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  Future<int> deleteStudent(int id) async {
    final Database db = await initializeDatabase();
    return db.delete(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
