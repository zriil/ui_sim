import 'package:flutter/material.dart';
import 'package:moch_s_application/widgets/custom_drawer.dart';

class PerkuliahanScreen extends StatelessWidget {
  final String username;

  const PerkuliahanScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(username: username), // ✅ pakai custom drawer
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E534F),
        title: const Text('PERKULIAHAN'),
      ),
      backgroundColor: Colors.teal.shade50,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  infoText("Mahasiswa", "231010035 - $username"),
                  infoText("Dosen Wali", "53020340 - Mufa Agung Barata, S.ST., M.Kom."),
                  infoText("Fakultas", "Fakultas Sains dan Teknologi"),
                  infoText("Jurusan", "Prodi TI - Teknik Informatika"),
                  infoText("Jenis Kelamin", "P (Perempuan)"),
                  infoText("NIDN Dosen", "0711048301"),
                  infoText("Kuri / Smt / SKS", "2021 / 4 / 19"),
                  infoText("Batas SKS Diambil", "24 SKS"),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.3,
                  children: [
                    featureCard("KRS", Icons.assignment),
                    featureCard("KTM", Icons.credit_card),
                    featureCard("Jadwal Kuliah", Icons.calendar_today),
                    featureCard("Presensi", Icons.fingerprint),
                    featureCard("Skripsi", Icons.menu_book),
                    featureCard("Quisioner", Icons.question_answer),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              child: const Text(
                'Powered by : Kelompok 5',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: RichText(
        text: TextSpan(
          text: '$label : ',
          style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }

  Widget featureCard(String title, IconData icon) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          // TODO: Tambahkan navigasi ke halaman terkait
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: title == "KRS" ||
                    title == "Jadwal Kuliah" ||
                    title == "Presensi" ||
                    title == "Skripsi"
                ? Colors.teal.shade100
                : Colors.yellow.shade200,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: Colors.black87),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
