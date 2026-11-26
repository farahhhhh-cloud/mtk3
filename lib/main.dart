import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const JarakPage(),
    );
  }
}

class JarakPage extends StatefulWidget {
  const JarakPage({super.key});

  @override
  State<JarakPage> createState() => _JarakPageState();
}

class _JarakPageState extends State<JarakPage> {
  final TextEditingController kecepatanController = TextEditingController();

  final TextEditingController waktuController = TextEditingController();

  double jarak = 0;

  void hitungJarak() {
    double kecepatan = double.tryParse(kecepatanController.text) ?? 0;

    double waktu = double.tryParse(waktuController.text) ?? 0;

    setState(() {
      jarak = kecepatan * waktu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text(
          'Rumus Jarak',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E3A5F),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Judul
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF172554),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF3B82F6),
                ),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.route,
                    size: 45,
                    color: Color(0xFF60A5FA),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Menghitung Jarak',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Masukkan kecepatan dan waktu',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Input Kecepatan
            TextField(
              controller: kecepatanController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                labelText: 'Kecepatan (v)',
                labelStyle: const TextStyle(
                  color: Colors.white70,
                ),
                prefixIcon: const Icon(
                  Icons.speed,
                  color: Color(0xFF60A5FA),
                ),
                filled: true,
                fillColor: const Color(0xFF1E293B),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Input Waktu
            TextField(
              controller: waktuController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                labelText: 'Waktu (t)',
                labelStyle: const TextStyle(
                  color: Colors.white70,
                ),
                prefixIcon: const Icon(
                  Icons.access_time,
                  color: Color(0xFF60A5FA),
                ),
                filled: true,
                fillColor: const Color(0xFF1E293B),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Tombol Hitung
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: hitungJarak,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'HITUNG JARAK',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Hasil
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    'HASIL',
                    style: TextStyle(
                      color: Color(0xFF60A5FA),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${jarak.toStringAsFixed(2)} km',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Jarak = Kecepatan × Waktu',
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
