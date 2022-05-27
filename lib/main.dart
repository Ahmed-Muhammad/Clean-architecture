import 'package:flutter/material.dart';

void main() {
  runApp(const CleanArchitecture());
}

class CleanArchitecture extends StatelessWidget {
  const CleanArchitecture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
