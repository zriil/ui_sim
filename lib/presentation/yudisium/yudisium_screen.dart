import 'package:flutter/material.dart';
import 'package:moch_s_application/widgets/custom_drawer.dart';

class YudisiumScreen extends StatelessWidget {
  final String username;

  const YudisiumScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(username: username),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E534F),
        title: const Text('YUDISIUM'),
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
              // Menu Ikon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  menuButton(
                    icon: Icons.folder,
                    title: 'Dokumen Wisuda',
                    color: Colors.amber.shade100,
                    onTap: () {},
                  ),
                  menuButton(
                    icon: Icons.description,
                    title: 'Data Yudisium',
                    color: Colors.teal.shade100,
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Proses Daftar Yudisium
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cara Proses daftar Yudisium',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text('''
1. Pastikan status tanggungan yang tertera pada Syarat Yudisium (Sebelah kanan) sudah tercantum secara keseluruhan.
2. Jika ada status yang belum tercantum, selesaikan pada petugas yang bersangkutan.
3. Tombol Form C2 – Transkrip akan aktif jika syarat yudisium telah selesai.
4. Form C2 tidak perlu menggunakan stempel 3 instansi yang terkait. (otomatis dari pengecekan sistem)
5. Bebas tanggungan akademik (nilai) serta download form C1, C3 dan Transkrip sementara diakses 1x24 jam sebelum akhir semester sampai admin proses setelah tanggungan laborat & Data alumni telah tercantum.
6. Setelah “Pengecekan Syarat Yudisium Mahasiswa” tercantum semua, maka mahasiswa siap di daftarkan sebagai peserta Yudisium.
                    '''),
                  ],
                ),
              ),
              const SizedBox(height: 20),
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

  Widget menuButton({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        height: 120,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.black87),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
