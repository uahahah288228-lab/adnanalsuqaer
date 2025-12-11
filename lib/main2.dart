import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String filecontaint = "";

  void _readTextFile() async {
    final Directory tempDir = await getTemporaryDirectory();
    final File file = File('${tempDir.path}/file_picker/a text file 005.txt');
    final String fileContent = await file.readAsString();

    setState(() {
      filecontaint = fileContent;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    File? file;
    FilePickerResult? result;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (file != null || result != null) ...[
              if (kIsWeb) ...[
                Image.memory(
                  result!.files.first.bytes!,
                  height: 177,
                  width: 360,
                  fit: BoxFit.fill,
                ),
              ] else ...[
                Image.file(file!, height: 177, width: 360, fit: BoxFit.fill),
              ],
              const SizedBox(height: 8),
            ],
            ElevatedButton(
              onPressed: () async {
                try {
                  result = await FilePicker.platform.pickFiles();
                  if (result != null) {
                    if (!kIsWeb) {
                      file = File(result!.files.single.path!);
                    }
                    setState(() {});
                  } else {
                    print("user canceled the picker");
                  }
                } catch (_) {}
              },
              child: const Text('Pick File'),
            ),
            Text(filecontaint),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}