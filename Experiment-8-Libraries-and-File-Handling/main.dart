import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FilePage(),
      ),
    );

class FilePage extends StatefulWidget {
  const FilePage({super.key});

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  String file = 'No file created';

  void save() {
    file = jsonEncode({
      'name': 'Student',
      'course': 'Flutter',
      'status': 'Saved ✅',
    });

    setState(() {});
  }

  void read() {
    setState(() {
      file = file == 'No file created'
          ? 'File not found'
          : jsonDecode(file)['status'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        title: const Text('File Manager'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Card(
          margin: const EdgeInsets.all(25),

          child: Padding(
            padding: const EdgeInsets.all(25),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.folder,
                  size: 70,
                  color: Colors.indigo,
                ),

                const SizedBox(height: 15),

                const Text(
                  'My File',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Text(file),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: save,
                  icon: const Icon(Icons.save),
                  label: const Text('Save'),
                ),

                OutlinedButton.icon(
                  onPressed: read,
                  icon: const Icon(Icons.file_open),
                  label: const Text('Read'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
