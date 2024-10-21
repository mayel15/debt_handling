import 'package:flutter/material.dart';

class InfosPage extends StatelessWidget {
  const InfosPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dettes'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(217, 217, 217, 217),
      ),
      body: const Text("Hello World!"),
    );
  }
}
