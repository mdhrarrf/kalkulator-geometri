import 'package:flutter/material.dart';
import '../components/custom_textfield.dart';
import '../controllers/formula.dart';

class BalokPage extends StatefulWidget {
  const BalokPage({super.key});

  @override
  State<BalokPage> createState() => _BalokPageState();
}

class _BalokPageState extends State<BalokPage> {
  final TextEditingController panjangController = TextEditingController();
  final TextEditingController lebarController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();

  double? volume, luasPermukaan;

  void hitung() {
    final p = double.tryParse(panjangController.text);
    final l = double.tryParse(lebarController.text);
    final t = double.tryParse(tinggiController.text);

    if (p != null && l != null && t != null) {
      setState(() {
        volume = Formula.volumeBalok(p, l, t);
        luasPermukaan = Formula.luasPermukaanBalok(p, l, t);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Balok')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Ilustrasi ikon
            const Icon(Icons.view_in_ar, size: 100, color: Colors.indigo),
            const SizedBox(height: 16),
            Text(
              "Kalkulator Balok",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
            ),
            const SizedBox(height: 24),

            // Card Input
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "Masukkan Dimensi Balok",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: panjangController,
                      label: "Panjang (cm)",
                      icon: Icons.straighten,
                    ),
                    CustomTextField(
                      controller: lebarController,
                      label: "Lebar (cm)",
                      icon: Icons.swap_horiz,
                    ),
                    CustomTextField(
                      controller: tinggiController,
                      label: "Tinggi (cm)",
                      icon: Icons.height,
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
            if (volume != null && luasPermukaan != null)
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
                          const Text("Volume", style: TextStyle(fontSize: 16)),
                          Text("${volume!.toStringAsFixed(2)} cm³",
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const Divider(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Luas Permukaan", style: TextStyle(fontSize: 16)),
                          Text("${luasPermukaan!.toStringAsFixed(2)} cm²",
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
