import 'package:flutter/material.dart';
import 'ganjil_genap_page.dart';
import 'tambah_kurang_page.dart';
import 'piramid_page.dart';
import 'stopwatch.dart';
import 'total_angka_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        _selectedIndex = 0;
      });
    } else {
      Widget page;

      switch (index) {
        case 1:
          page = GanjilGenapPage();
          break;
        case 2:
          page = TambahKurangPage();
          break;
        case 3:
          page = PiramidPage();
          break;
        case 4:
          page = TotalAngkaPage();
          break;
        case 5:
          page = StopwatchPage();
          break;
        default:
          page = GanjilGenapPage();
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu Utama',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.3)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1E293B).withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              ),
              child: Column(
                children: const [

                  Text(
                    "ANGGOTA KELOMPOK",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF2563EB),
                    )
                  ),

                  SizedBox(height: 12),

                  Text(
                    "Mohammad Atilla Danadyaksa (123230134)",
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 6),

                  Text(
                    "Akmal Danendra Maulana (123230135)",
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 6),

                  Text(
                    "Hafiz Alaudin Rasendriya (123230149)",
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 6),

                  Text(
                    "Dida Attallah Elfasdi (123230145)",
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            ),

            const SizedBox(height: 40),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pilih Fitur',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [

                _buildMenuCard(
                  context,
                  'Menu 1',
                  'Ganjil Genap & Prima',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GanjilGenapPage()),
                    );
                  },
                ),

                _buildMenuCard(
                  context,
                  'Menu 2',
                  'Kalkulator Tambah Kurang',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TambahKurangPage()),
                    );
                  },
                ),

                _buildMenuCard(
                  context,
                  'Menu 3',
                  'Luas & Volume Piramid',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PiramidPage()),
                    );
                  },
                ),

                _buildMenuCard(
                  context,
                  'Menu 4',
                  'Total Angka',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TotalAngkaPage()),
                    );
                  },
                ),

                _buildMenuCard(
                  context,
                  'Menu 5',
                  'Stopwatch',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StopwatchPage()),
                    );
                  },
                ),

              ],
            )

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF2563EB),
        onTap: _onItemTapped,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.filter_1),
            label: "Cek Angka",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Kalkulator",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.change_history),
            label: "Piramid",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            label: "Total Angka",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: "Stopwatch",
          ),

        ],
      ),

    );
  }

  Widget _buildMenuCard(
      BuildContext context,
      String menuNumber,
      String title,
      VoidCallback onTap) {

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: (MediaQuery.of(context).size.width / 2) - 28,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
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

            Text(
              menuNumber,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2563EB),
              ),
            ),

          ],
        ),
      ),
    );
  }
}