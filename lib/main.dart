import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SebhaApp(),  
    );
  }
}

class SebhaApp extends StatefulWidget {
  const SebhaApp({super.key});

  @override
  State<SebhaApp> createState() => _SebhaAppState();
}

class _SebhaAppState extends State<SebhaApp> {
  String text = "";
  int count = 0;

  void onPress(String t) {
    setState(() {
      text = t;
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("  مسبحة الكترونيه" ),backgroundColor: Colors.red,centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          Text(
            "$count",
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => onPress("سبحان الله"),
                child: const Text("سبحان الله"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => onPress("الحمدلله"),
                child: const Text("الحمدلله"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => onPress("الله اكبر"),
                child: const Text("الله اكبر"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}