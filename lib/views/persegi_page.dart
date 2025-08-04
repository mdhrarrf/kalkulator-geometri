import 'package:flutter/material.dart';
import '../components/custom_textfield.dart';
import '../controllers/formula.dart';

class PersegiPage extends StatefulWidget {
  const PersegiPage({super.key});

  @override
  State<PersegiPage> createState() => _PersegiPageState();
}

class _PersegiPageState extends State<PersegiPage> {
  final TextEditingController sisiController = TextEditingController();
  double? luas, keliling;

  void hitung() {
    final sisi = double.tryParse(sisiController.text);
    if (sisi != null) {
      setState(() {
        luas = Formula.luasPersegi(sisi);
        keliling = Formula.kelilingPersegi(sisi);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Persegi')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Ikon ilustratif
            const Icon(Icons.crop_square, size: 100, color: Colors.indigo),
            const SizedBox(height: 16),
            Text(
              "Kalkulator Persegi",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
            ),
            const SizedBox(height: 24),

            // Card Form
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "Masukkan Panjang Sisi",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: sisiController,
                      label: "Panjang Sisi (cm)",
                      icon: Icons.square_foot,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: hitung,
                      icon: const Icon(Icons.calculate),
                      label: const Text("Hitung"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Card Hasil
            if (luas != null && keliling != null)
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                color: Colors.indigo[50],
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Hasil Perhitungan",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Luas", style: TextStyle(fontSize: 16)),
                          Text("${luas!.toStringAsFixed(2)} cm²",
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const Divider(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Keliling", style: TextStyle(fontSize: 16)),
                          Text("${keliling!.toStringAsFixed(2)} cm",
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
