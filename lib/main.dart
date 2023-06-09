import 'package:flutter/material.dart';
import 'package:flutter_provider_02022023/demo_changenotifier.dart';
import 'package:flutter_provider_02022023/demo_provider.dart';
import 'package:flutter_provider_02022023/demo_valuelistenable_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoValueListenableProviderWidget()
    );
  }
}
