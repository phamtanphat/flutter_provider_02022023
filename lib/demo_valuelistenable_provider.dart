import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Count {
  ValueNotifier<int> number = ValueNotifier(0);
}

class DemoValueListenableProviderWidget extends StatefulWidget {
  const DemoValueListenableProviderWidget({Key? key}) : super(key: key);

  @override
  State<DemoValueListenableProviderWidget> createState() =>
      _DemoValueListenableProviderWidgetState();
}

class _DemoValueListenableProviderWidgetState
    extends State<DemoValueListenableProviderWidget> {
  @override
  Widget build(BuildContext context) {
    Count count = Count();
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo Value Listenable Provider"),
        ),
        body: ValueListenableBuilder<int>(
          valueListenable: count.number,
          builder: (context, __, _) {
            return ChildWidget(count: count);
          },
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ChildWidget extends StatelessWidget {
  Count count;

  ChildWidget({required this.count});

  @override
  Widget build(BuildContext context) {
    print("Child rebuild");
    return Container(
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Child ${count.number.value}"),
          ElevatedButton(
              onPressed: (){
                count.number.value += 1;
              },
              child: Text("Increase")
          )
        ],
      ),
    );
  }
}
