import 'package:flutter/material.dart';

class StudentDetail extends StatefulWidget {
  final List<Map<String, String>> students;
  final Function(Map<String, String>) onAddStudent;
  final Function(int) onDeleteStudent;

  const StudentDetail({
    super.key,
    required this.students,
    required this.onAddStudent,
    required this.onDeleteStudent,
  });

  @override
  State<StudentDetail> createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  String selectedCity = 'Kathmandu'; // Default city
  bool isViewingStudents = false; // Toggle between Add and View modes

  // List of Nepal cities for the dropdown
  final List<String> cities = [
    'Kathmandu',
    'Pokhara',
    'Lalitpur',
    'Bhaktapur',
    'Biratnagar',
    'Birgunj',
    'Dharan',
    'Butwal',
    'Nepalgunj',
    'Janakpur',
  ];

  // Add a student to the list
  void _submitStudent() {
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();

    if (firstName.isNotEmpty && lastName.isNotEmpty) {
      widget.onAddStudent({
        'firstName': firstName,
        'lastName': lastName,
        'city': selectedCity,
      });
      firstNameController.clear();
      lastNameController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student added successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Toggle between Add Student and View Students
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isViewingStudents = false;
                    });
                  },
                  child: const Text('Student'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isViewingStudents = true;
                    });
                  },
                  child: const Text('View Students'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            isViewingStudents
                ? Expanded(
                    child: widget.students.isEmpty
                        ? const Center(child: Text('No students added yet.'))
                        : ListView.builder(
                            itemCount: widget.students.length,
                            itemBuilder: (context, index) {
                              final student = widget.students[index];
                              return Card(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    child: Text((index + 1).toString()),
                                  ),
                                  title: Text(
                                      '${student['firstName']} ${student['lastName']}'),
                                  subtitle: Text('City: ${student['city']}'),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    onPressed: () {
                                      widget.onDeleteStudent(index);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Student deleted')),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                  )
                : Column(
                    children: [
                      // Input fields for student details
                      TextField(
                        controller: firstNameController,
                        decoration:
                            const InputDecoration(labelText: 'First Name'),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: lastNameController,
                        decoration:
                            const InputDecoration(labelText: 'Last Name'),
                      ),
                      const SizedBox(height: 10),
                      // Dropdown menu for city selection
                      DropdownButtonFormField<String>(
                        value: selectedCity,
                        items: cities
                            .map((city) => DropdownMenuItem<String>(
                                  value: city,
                                  child: Text(city),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedCity = value;
                            });
                          }
                        },
                        decoration: const InputDecoration(labelText: 'City'),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _submitStudent,
                        child: const Text('Add Student'),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
