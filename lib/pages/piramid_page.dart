import 'dart:math';
import 'package:flutter/material.dart';

class PiramidPage extends StatefulWidget {
  const PiramidPage({super.key});

  @override
  _PiramidPageState createState() => _PiramidPageState();
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
          content: Text('Isi dulu panjang sisi sama tingginya ya!'),
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
          content: Text(
            'Input harus bilangan bulat atau desimal.',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    double sisi = double.parse(_sisiController.text);
    double tinggi = double.parse(_tinggiController.text);

    double volume = (1 / 3) * (sisi * sisi) * tinggi;

    double tinggiMiring =
        sqrt(pow((sisi / 2), 2) + pow(tinggi, 2));

    double luasPermukaan =
        (sisi * sisi) + (4 * (0.5 * sisi * tinggiMiring));

    setState(() {

      volume = double.parse(volume.toStringAsFixed(10));
      luasPermukaan = double.parse(luasPermukaan.toStringAsFixed(10));

      _hasilVolume = volume.toString();
      _hasilLuas = luasPermukaan.toString();

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
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 24,
          ),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),

            boxShadow: [
              BoxShadow(
                color: const Color(0xFF1E293B)
                    .withValues(alpha: 0.06),
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
                  border: Border.all(
                    color: const Color(0xFFE2E8F0),
                  ),
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
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,

                      children: [

                        Column(
                          children: [
                            const Text(
                              'Luas Permukaan',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              _hasilLuas,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2563EB),
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
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              _hasilVolume,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2563EB),
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
                keyboardType: TextInputType.text,

                decoration: InputDecoration(
                  labelText: 'Panjang Sisi Alas',

                  labelStyle:
                      TextStyle(color: Colors.grey[600]),

                  prefixIcon: const Icon(
                    Icons.square_foot,
                    color: Color(0xFF2563EB),
                  ),

                  filled: true,
                  fillColor: Colors.grey[50],

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: _tinggiController,
                keyboardType: TextInputType.text,

                decoration: InputDecoration(
                  labelText: 'Tinggi Piramid',

                  labelStyle:
                      TextStyle(color: Colors.grey[600]),

                  prefixIcon: const Icon(
                    Icons.height,
                    color: Color(0xFF2563EB),
                  ),

                  filled: true,
                  fillColor: Colors.grey[50],

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
                  minimumSize:
                      const Size(double.infinity, 50),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                child: const Text(
                  'Hitung Sekarang',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
