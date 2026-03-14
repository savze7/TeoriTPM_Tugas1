import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TambahKurangPage extends StatefulWidget {
  const TambahKurangPage({super.key});

  @override
  _TambahKurangPageState createState() => _TambahKurangPageState();
}

class _TambahKurangPageState extends State<TambahKurangPage> {
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();

  String _hasil = "0";

  void _hitung(String operasi) {

    if (_angka1Controller.text.isEmpty || _angka2Controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Isi dulu kedua angka!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    final regex = RegExp(r'^-?\d+(\.\d+)?$');

    if (!regex.hasMatch(_angka1Controller.text) ||
        !regex.hasMatch(_angka2Controller.text)) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Input harus bilangan bulat atau desimal (boleh minus).",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    double angka1 = double.parse(_angka1Controller.text);
    double angka2 = double.parse(_angka2Controller.text);

    double hasil;

    if (operasi == '+') {
      hasil = angka1 + angka2;
    } else {
      hasil = angka1 - angka2;
    }

    setState(() {
      hasil = double.parse(hasil.toStringAsFixed(10));

      if (hasil == hasil.toInt()) {
        _hasil = hasil.toInt().toString();
      } else {
        _hasil = hasil.toString();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      appBar: AppBar(
        title: const Text(
          'Kalkulator Tambah Kurang',
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
                color: const Color(0xFF1E293B).withValues(alpha: 0.06),
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
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    Text(
                      'Hasil Akhir',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      _hasil,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2563EB),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              TextField(
                controller: _angka1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Angka Pertama',
                  prefixIcon: const Icon(Icons.looks_one),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: _angka2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Angka Kedua',
                  prefixIcon: const Icon(Icons.looks_two),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Row(
                children: [

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _hitung('+'),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),

                      child: const Icon(Icons.add, size: 28),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _hitung('-'),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),

                      child: const Icon(Icons.remove, size: 28),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}