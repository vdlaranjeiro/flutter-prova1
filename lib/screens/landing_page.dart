import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        // corpo do aplicativo
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 100.0),
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(5.0),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.school,
                size: 100.0,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/login_page'),
              child: const Text('Acessar'),
            ),
          ],
        ),
      ),
    );
  }
}