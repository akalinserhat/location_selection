import 'package:flutter/material.dart';
import 'package:location_selection/location_selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Selection Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Location Selection Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late LocationSelectionController controller;

  @override
  void initState() {
    controller = LocationSelectionController(text: "Unknown Address");
    super.initState();
  }

  Future<void> onTapRefresh() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Refresh"),
            content: const Text("You taped refresh button !!!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Ok"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LocationSelection(
                controller: controller,
                onTapRefreshIcon: () => onTapRefresh(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.setState(
                    state: LocationSelectionState.refreshing,
                    text: "",
                  );
                },
                child: const Text("Refreshing"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.setState(
                    state: LocationSelectionState.unknownAddress,
                    text: "Unknown Address",
                  );
                },
                child: const Text("Unknown Adress"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.setState(
                    state: LocationSelectionState.knownAddress,
                    text: "Known Address",
                  );
                },
                child: const Text("Known Adress"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
