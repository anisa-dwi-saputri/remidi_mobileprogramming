import 'package:flutter/material.dart';

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
    {'nama': 'BAGUS YANUAR FITRIADI', 'nim': 'STE202202870'},
    {'nama': 'ADINI MEILINA', 'nim': 'STE202202871'},
    {'nama': 'ALDI TATA IRFANSAH', 'nim': 'STE202202872'},
    {'nama': 'ANDRIANSYAH', 'nim': 'STE202202873'},
    {'nama': 'ANGGA MUSFIK JAITUN	', 'nim': 'STE202202874'},
    {'nama': 'ANISA DWI SAPUTRI	', 'nim': 'STE202202875'}, // Anda di nomor 6
    {'nama': 'AYUB DWI SURYO ', 'nim': 'STE202202876'},
    {'nama': 'BAGAS TRI PURWOKO', 'nim': 'STE202202877'},
    {'nama': 'CYNDI YUNI NOVITASARI', 'nim': 'STE202202878'},
    {'nama': 'DESTI PUSPANINGRUM', 'nim': 'STE202202879'},
    {'nama': 'DIAN NANDA ELISMA', 'nim': 'STE202202880'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Color.fromARGB(255, 48, 46, 46),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0), // Jarak dengan teks atasnya
                    child: Text(
                      'Remidi Mobile programming ANISA DWI SAPUTRI STE202202875',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  height: 100.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: index % 2 == 0 ? Colors.blue : Colors.green,
                    ),
                    child: ListTile(
                      title: Text(
                        mahasiswa[index]['nama']!,
                        style: const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      subtitle: Text(
                        'NIM: ${mahasiswa[index]['nim']}',
                        style: const TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ),
                  ),
                );
              },
              childCount: mahasiswa.length,
            ),
          ),
        ],
      ),
    );
  }
}
