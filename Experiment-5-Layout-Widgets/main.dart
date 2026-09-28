import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutPage(),
    ));

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        title: const Text(
          'My Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, Student! 👋',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              'Everything you need in one place',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.indigo, Colors.blue],
                ),
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 38,
                      color: Colors.indigo,
                    ),
                  ),

                  SizedBox(width: 15),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Student Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        'Welcome back!',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Quick Access',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: box(Icons.book, 'Courses'),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: box(Icons.assignment, 'Tasks'),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: box(Icons.star, 'Favorites'),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: box(Icons.settings, 'Settings'),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Card(
              child: Padding(
                padding: EdgeInsets.all(18),

                child: Row(
                  children: [
                    Icon(
                      Icons.lightbulb,
                      size: 32,
                      color: Colors.orange,
                    ),

                    SizedBox(width: 15),

                    Expanded(
                      child: Text(
                        'Flutter layout widgets help create clean and responsive interfaces.',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget box(IconData icon, String text) => Container(
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),

          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black12,
            ),
          ],
        ),

        child: Column(
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.indigo,
            ),

            const SizedBox(height: 10),

            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
}
