import 'package:flutter/material.dart';
import 'package:moch_s_application/widgets/custom_drawer.dart';

class NewSpekmaScreen extends StatelessWidget {
  final String username;

  const NewSpekmaScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(username: username),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E534F),
        title: const Text('New SPEKMA'),
      ),
      backgroundColor: Colors.teal.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Informasi Mahasiswa
              Container(
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
              const SizedBox(height: 20),

              // Tombol Menu
              menuBox(
                icon: Icons.upload_file,
                title: "PENGAJUAN SPEKMA",
                color: Colors.teal.shade200,
                onTap: () {
                  // Aksi navigasi ke form pengajuan
                },
              ),
              const SizedBox(height: 20),
              menuBox(
                icon: Icons.folder,
                title: "LAPORAN SPEKMA",
                color: Colors.amber.shade200,
                onTap: () {
                  // Aksi navigasi ke laporan
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Powered by: Kelompok 5',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
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

  Widget menuBox({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(1, 2),
            )
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.black87),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}