import 'package:flutter/material.dart';
import 'package:moch_s_application/widgets/custom_drawer.dart';

class LaporanScreen extends StatelessWidget {
  final String username;

  const LaporanScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(username: username),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E534F),
        title: const Text('LAPORAN'),
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
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  laporanCard(
                    title: "Kartu Hasil Studi",
                    description: "KHS dapat dilihat dan dicetak melalui menu ini",
                    icon: Icons.article_outlined,
                    color: Colors.teal.shade100,
                  ),
                  laporanCard(
                    title: "Kemajuan Belajar",
                    description:
                        "Nama : $username\nFakultas : Sains dan Teknologi\nIPK : 3.85  Angkatan : 2021 / SKS LULUS : 50",
                    icon: Icons.bar_chart,
                    color: Colors.yellow.shade100,
                  ),
                  laporanCard(
                    title: "Daftar Nilai",
                    description:
                        "Menu ini menyediakan akses data nilai mahasiswa berdasarkan periode akademik",
                    icon: Icons.grade_outlined,
                    color: Colors.teal.shade100,
                  ),
                  laporanCard(
                    title: "Riwayat Mengulang",
                    description:
                        "Menu ini menampilkan catatan mata kuliah yang pernah diulang",
                    icon: Icons.history,
                    color: Colors.yellow.shade100,
                  ),
                  laporanCard(
                    title: "Keuangan",
                    description: "Rincian Tagihan dan Pembayaran Mahasiswa",
                    icon: Icons.attach_money,
                    color: Colors.teal.shade100,
                  ),
                ],
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

  Widget laporanCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32, color: Colors.black87),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
