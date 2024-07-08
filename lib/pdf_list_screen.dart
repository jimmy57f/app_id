import 'package:flutter/material.dart';
import 'pdf_screen.dart';

class PDFListScreen extends StatelessWidget {
  final List<Map<String, String>> pdfFiles = [
    {
      'name': 'Escuela General',
      'path': 'assets/escuelageneral032024.pdf',
      'image': 'assets/general.jpg'
    },
    {
      'name': 'Escuela Juvenil',
      'path': 'assets/escuelajuvenil032024.pdf',
      'image': 'assets/jovenes.jpg'
    },
    {
      'name': 'Escuela Infantil',
      'path': 'assets/escuelainfantil032024.pdf',
      'image': 'assets/niños.jpg'
    },
    {
      'name': 'Escuela Femenil',
      'path': 'assets/escuelafemenil032024.pdf',
      'image': 'assets/femenil2.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Escuelas Sabáticas',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: pdfFiles.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.asset(
                      pdfFiles[index]['image']!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(pdfFiles[index]['name']!),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PDFViewerScreen(pdfFiles[index]['path']!),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            child: Image.asset(
              'assets/BAUTIZOS.png',
              width: 300,
              height: 450,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
