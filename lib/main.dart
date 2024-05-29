import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Mahasiswa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Daftar Mahasiswa'),
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
  final List<Map<String, String>> mahasiswa = [
    {'nama': 'YUSUF JAUHAR ALIF FAQIH', 'nim': 'STI202102390'},
    {'nama': 'FEBRY ADI PRATAMA', 'nim': 'STI202102391'},
    {'nama': 'RANDI PANGESTU', 'nim': 'STI202102392'},
    {'nama': 'SEPTIASIH NUR INAYAH', 'nim': 'STI202102393'},
    {'nama': 'WILSYA NURALISA', 'nim': 'STI202102394'},
  ];

  int _currentIndex = 0;
  late Timer _timer;
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];
  Color _currentColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _currentColor = _colors[_currentIndex];
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % mahasiswa.length;
        _currentColor = _colors[_currentIndex];
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                mahasiswa[_currentIndex]['nama']!,
                style: TextStyle(
                  fontSize: 24,
                  color: _currentColor,
                ),
              ),
              Text(
                'NIM: ${mahasiswa[_currentIndex]['nim']}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
