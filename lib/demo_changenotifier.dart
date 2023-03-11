import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Count extends ChangeNotifier {
  int value = 0;

  inCrease() {
    value += 1;
    notifyListeners();
  }
}

class DemoChangeNotifierProviderWidget extends StatefulWidget {
  const DemoChangeNotifierProviderWidget({Key? key}) : super(key: key);

  @override
  State<DemoChangeNotifierProviderWidget> createState() =>
      _DemoChangeNotifierProviderWidgetState();
}

class _DemoChangeNotifierProviderWidgetState
    extends State<DemoChangeNotifierProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo Change Notifier Provider"),
        ),
        body: ChangeNotifierProvider(
            create: (context) => Count(),
            child: ChildWidget(),
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      constraints: BoxConstraints.expand(),
      child: Consumer<Count>(
        builder: (context, count, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Child ${count.value}"),
              ElevatedButton(
                  onPressed: (){
                    count.inCrease();
                  },
                  child: Text("Increase")
              )
            ],
          );
        }
      ),
    );
  }
}
