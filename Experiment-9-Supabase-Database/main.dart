
import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

const url = 'https://odvqfrfctmrdsazhnjam.supabase.co';
const key = 'YOUR_PUBLISHABLE_KEY';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.deepPurple,
          useMaterial3: true,
        ),
        home: const StudentPage(),
      );
}

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final id = TextEditingController();
  final name = TextEditingController();
  final course = TextEditingController();

  String msg = 'Enter student details';

  Map<String, String> get headers => {
        'apikey': key,
        'Content-Type': 'application/json',
      };

  Future<void> save() async {
    try {
      final response = await html.HttpRequest.request(
        '$url/rest/v1/students',
        method: 'POST',
        requestHeaders: {
          ...headers,
          'Prefer': 'return=minimal',
        },
        sendData: jsonEncode({
          'id': int.parse(id.text),
          'name': name.text,
          'course': course.text,
        }),
      );
      setState(() => msg = 'Student saved successfully!');
    } catch (e) {
      setState(() => msg = 'Save failed. Check ID and database policies.');
    }
  }

  Future<void> read() async {
    try {
      final response = await html.HttpRequest.request(
        '$url/rest/v1/students?select=*',
        requestHeaders: headers,
      );
      setState(() => msg = response.responseText ?? 'No records found');
    } catch (e) {
      setState(() => msg = 'Read failed. Check database policies.');
    }
  }

  Future<void> delete() async {
    try {
      await html.HttpRequest.request(
        '$url/rest/v1/students?id=eq.${id.text}',
        method: 'DELETE',
        requestHeaders: headers,
      );
      setState(() => msg = 'Delete request completed!');
    } catch (e) {
      setState(() => msg = 'Delete failed. Check Student ID and policies.');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Student Database')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: id,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Student ID',
                ),
              ),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  labelText: 'Student Name',
                ),
              ),
              TextField(
                controller: course,
                decoration: const InputDecoration(
                  labelText: 'Course',
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: save,
                    child: const Text('SAVE'),
                  ),
                  ElevatedButton(
                    onPressed: read,
                    child: const Text('READ'),
                  ),
                  ElevatedButton(
                    onPressed: delete,
                    child: const Text('DELETE'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(msg),
            ],
          ),
        ),
      );
}
