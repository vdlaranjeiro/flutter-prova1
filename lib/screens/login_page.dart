import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      alignment: Alignment.topCenter,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
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
          onPressed: () => Navigator.pop(context),
          child: const Text('Entrar'),
        )
      ]),
    ));
  }
}
