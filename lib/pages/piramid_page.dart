import 'dart:math';
import 'package:flutter/material.dart';

class PiramidPage extends StatefulWidget {
  const PiramidPage({super.key});

  @override
  State<PiramidPage> createState() => _PiramidPageState();
}

class _PiramidPageState extends State<PiramidPage> {
  final TextEditingController _sisiController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();

  String _hasilVolume = "0";
  String _hasilLuas = "0";

  void _hitungPiramid() {
    if (_sisiController.text.isEmpty || _tinggiController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Isi dulu panjang sisi dan tinggi!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final regex = RegExp(r'^\d+(\.\d+)?$');

    if (!regex.hasMatch(_sisiController.text) ||
        !regex.hasMatch(_tinggiController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Input harus angka dan tidak bisa Minus!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    double sisi = double.parse(_sisiController.text);
    double tinggi = double.parse(_tinggiController.text);

    double volume = (1 / 3) * sisi * sisi * tinggi;

    double tinggiMiring = sqrt(pow((sisi / 2), 2) + pow(tinggi, 2));

    double luasPermukaan = (sisi * sisi) + (4 * (0.5 * sisi * tinggiMiring));

    setState(() {
      _hasilVolume = volume.toStringAsFixed(5);
      _hasilLuas = luasPermukaan.toStringAsFixed(5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Luas & Volume Piramid',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  children: [
                    Text(
                      'Hasil Perhitungan (Alas Persegi)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Luas Permukaan',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width: 120,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  _hasilLuas,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2563EB),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 1,
                          color: Colors.grey.shade300,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Volume',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width: 120,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  _hasilVolume,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2563EB),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _sisiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Panjang Sisi Alas',
                  prefixIcon: const Icon(Icons.square_foot),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _tinggiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Tinggi Piramid',
                  prefixIcon: const Icon(Icons.height),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _hitungPiramid,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Hitung Sekarang',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}