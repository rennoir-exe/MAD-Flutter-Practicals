import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => const Home(),
          '/courses': (_) => const Page(
                title: 'My Courses',
                icon: Icons.book,
              ),
          '/profile': (_) => const Page(
                title: 'My Profile',
                icon: Icons.person,
              ),
        },
      ),
    );

class Home extends StatelessWidget {
  const Home({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        title: const Text('Student Hub'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Padding(
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

            const SizedBox(height: 5),

            Text(
              'What would you like to do?',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 25),

            card(
              context,
              Icons.book,
              'My Courses',
              '/courses',
            ),

            card(
              context,
              Icons.person,
              'My Profile',
              '/profile',
            ),

            const Spacer(),

            Center(
              child: GestureDetector(
                onDoubleTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('You found the secret! ❤️'),
                    ),
                  );
                },

                child: const Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 50,
                      color: Colors.indigo,
                    ),

                    SizedBox(height: 8),

                    Text('Double Tap Me ❤️'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget card(
    BuildContext context,
    IconData icon,
    String text,
    String route,
  ) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        route,
      ),

      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
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

        child: Row(
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.indigo,
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String title;
  final IconData icon;

  const Page({
    super.key,
    required this.title,
    required this.icon,
  });

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: GestureDetector(
          onDoubleTap: () => Navigator.pop(context),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 80,
                color: Colors.indigo,
              ),

              const SizedBox(height: 15),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text('Double tap to go back'),
            ],
          ),
        ),
      ),
    );
  }
}
