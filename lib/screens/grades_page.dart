import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Grades extends StatefulWidget {
  const Grades({super.key});

  @override
  State<Grades> createState() => _GradesState();
}

class _GradesState extends State<Grades> {
  List<dynamic> alunos = [];
  List<dynamic> alunosFiltrados = [];
  String filtro = '';

  Color getTileColor(double nota) {
    if (nota == 100) {
      return Colors.green.shade200;
    } else if (nota >= 60) {
      return Colors.blue.shade200;
    } else {
      return Colors.yellow.shade200;
    }
  }

  Future<void> fetchAlunos() async {
    final response =
        await http.get(Uri.parse("http://demo4583879.mockable.io/notasAlunos"));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      setState(() {
        alunos = jsonResponse;
        alunosFiltrados = alunos;
      });
    }
  }

  void filtrarAlunos(String nota) {
    // reset do filtro
    if (filtro == nota) {
      return setState(() {
        alunosFiltrados = alunos;
        filtro = '';
      });
    }

    if (nota == '100') {
      setState(() {
        alunosFiltrados = alunos.where((aluno) => aluno['nota'] == 100).toList();
        filtro = nota;
      });
    } else if (nota == '>=60') {
      setState(() {
        alunosFiltrados = alunos
            .where((aluno) => aluno['nota'] >= 60 && aluno['nota'] != 100)
            .toList();
        filtro = nota;
      });
    } else if (nota == '<60') {
      setState(() {
        alunosFiltrados = alunos.where((aluno) => aluno['nota'] < 60).toList();
        filtro = nota;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAlunos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 300,
          child: Column(
            children: [
              const SizedBox(height: 100),
              Flexible(
                fit: FlexFit.loose,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: alunosFiltrados.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: ListTile(
                        tileColor: getTileColor(alunosFiltrados[index]['nota']),
                        title: Row(
                          children: [
                            Text(alunosFiltrados[index]['nome']),
                            const SizedBox(width: 10),
                            Text(alunosFiltrados[index]['nota'].toString())
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => filtrarAlunos('<60'),
                    child: const Text('<60'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => filtrarAlunos('>=60'),
                    child: const Text('>=60'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => filtrarAlunos('100'),
                    child: const Text('100'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}