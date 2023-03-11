import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DemoProviderWidget extends StatefulWidget {
  const DemoProviderWidget({Key? key}) : super(key: key);

  @override
  State<DemoProviderWidget> createState() => _DemoProviderWidgetState();
}

class _DemoProviderWidgetState extends State<DemoProviderWidget> {
  HashMap<String, String> map = HashMap();

  @override
  Widget build(BuildContext context) {
    map["name"] = "Pham Tan phat";
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Provider"),
      ),
      body: Container(
        child: Provider.value(
            value: map,
            child: Column(
              children: [
                ChildWidget(),
                Child1Widget()
              ],
            ),
        ),
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {

  @override
  State<ChildWidget> createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  Widget build(BuildContext context) {
    HashMap<String, String> map = Provider.of(context);
    return Container(
      child: Text(map["name"] ?? ""),
    );
  }
}

class Child1Widget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<HashMap<String, String>>(
        builder: (context, data, child) {
          return Text("Child 1 ${data["name"]}");
        }
    );
  }
}


