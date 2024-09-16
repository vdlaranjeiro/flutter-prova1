import 'package:flutter/material.dart';

class Grades extends StatefulWidget {
  const Grades({ super.key });

  @override
  State<Grades> createState() => _GradesState();
}

class _GradesState extends State<Grades> {
  List<Map<String, dynamic>> alunos = [
    {'nome': 'Ana', 'nota': 55},   // <60
    {'nome': 'Bruno', 'nota': 62}, // >=60
    {'nome': 'Carla', 'nota': 75}, // >=60
    {'nome': 'Daniel', 'nota': 58},// <60
    {'nome': 'Elena', 'nota': 82}, // >=60
    {'nome': 'Felipe', 'nota': 45},// <60
    {'nome': 'Gisele', 'nota': 91},// >=60
    {'nome': 'Henrique', 'nota': 100}, // 100
    {'nome': 'Igor', 'nota': 88},  // >=60
    {'nome': 'Júlia', 'nota': 100} // 100
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              itemCount: alunos.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Row(
                    children: [
                      Text(alunos[index]['nome']),
                      const SizedBox(width: 10),
                      Text(alunos[index]['nota'].toString())
                    ],
                  )
                );
              },
            )
          ]
        ),
      )
    );
  }
}