import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UmurPage extends StatefulWidget {
  const UmurPage({super.key});

  @override
  State<UmurPage> createState() => _UmurPageState();
}

class _UmurPageState extends State<UmurPage> {
  DateTime? birthDate;
  TimeOfDay? birthTime;
  String ageResult = "-";

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          birthDate = pickedDate;
          birthTime = pickedTime;
          _calculateAge();
        });
      }
    }
  }

  void _calculateAge() {
    if (birthDate == null || birthTime == null) return;

    final birthDateTime = DateTime(
      birthDate!.year,
      birthDate!.month,
      birthDate!.day,
      birthTime!.hour,
      birthTime!.minute,
    );

    final now = DateTime.now();
    
    int years = now.year - birthDateTime.year;
    int months = now.month - birthDateTime.month;
    int days = now.day - birthDateTime.day;
    int hours = now.hour - birthDateTime.hour;
    int minutes = now.minute - birthDateTime.minute;

    if (minutes < 0) {
      minutes += 60;
      hours--;
    }
    if (hours < 0) {
      hours += 24;
      days--;
    }
    if (days < 0) {
      final lastMonth = DateTime(now.year, now.month, 0);
      days += lastMonth.day;
      months--;
    }
    if (months < 0) {
      months += 12;
      years--;
    }

    ageResult = "$years Tahun\n$months Bulan\n$days Hari\n$hours Jam\n$minutes Menit";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kalkulator Usia',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Masukkan informasi waktu kelahiran Anda:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => _selectDateTime(context),
                icon: const Icon(Icons.access_time_filled),
                label: const Text(
                  "Pilih Tanggal & Waktu",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 32),
            if (birthDate != null && birthTime != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1E293B).withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ]
                ),
                child: Column(
                  children: [
                    const Text(
                      "WAKTU KELAHIRAN",
                      style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${DateFormat('dd MMMM yyyy').format(birthDate!)} - ${birthTime!.format(context)}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Divider(),
                    ),
                    const Text(
                      "USIA ANDA SAAT INI",
                      style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      ageResult,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20, 
                        fontWeight: FontWeight.bold, 
                        color: Color(0xFF2563EB),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}