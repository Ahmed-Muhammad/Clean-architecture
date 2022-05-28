import 'package:flutter/material.dart';

import 'src/core/themes/app_theme.dart';

void main() {
  runApp(const CleanArchitecture());
}

class CleanArchitecture extends StatelessWidget {
  const CleanArchitecture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('hello world'),
          ),
        ),
      ),
    );
  }
}
