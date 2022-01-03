import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(const MaterialApp(home: MyHomePage()));
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform =  MethodChannel("com.example.flutter_sceneform/ar_viewer");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Execute Java Function'),
                  onPressed: t1,
                ),
              ],
            ),
          ),
        )
    );
  }

  void t1() async {
    try {
      String t = await platform.invokeMethod("arv");
      print(t);
    } catch (e) {
      print(e);
    }
  }
}
