import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  String _token = '';

  Future<void> login() async {
    final response = await http.post(
      Uri.parse("http://demo4583879.mockable.io/login"),
      body: {
        'nome': _nome.text,
        'senha': _senha.text,
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final token = jsonResponse['token'];

      setState(() {
        _token = token;
      });

      Navigator.pushNamed(context, '/grades_page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _nome,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome',
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _senha,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () => {login()},
              child: const Text('Entrar'),
            ),
            const SizedBox(height: 10),
            _token.isEmpty ? const SizedBox() : Text("token: $_token"),
          ],
        ),
      ),
    );
  }
}