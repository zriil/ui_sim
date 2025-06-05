import 'package:flutter/material.dart';
import 'package:moch_s_application/widgets/custom_drawer.dart';


class DashboardScreen extends StatelessWidget {
  final String username;

  const DashboardScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(username: username), // ✅ Menggunakan drawer terpisah
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: const Color(0xFF1E534F),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang,\n$username',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _buildRoleTag(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildInfoCard('Jumlah SKS Aktif', '20'),
                      _buildInfoCard('IPK Terakhir', '3,80'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildScheduleCard(),
                  const SizedBox(height: 16),
                  _buildAnnouncementCard(),
                  const SizedBox(height: 16),
                  _buildActionButton('Notifikasi Terbaru'),
                  const SizedBox(height: 8),
                  _buildActionButton('Kalender Akademik'),
                  const SizedBox(height: 16),
                  _buildSystemIcons(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          // Footer
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
    );
  }

  Widget _buildRoleTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 30, 83, 79),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        'Daftar Role SIM Akademik\nMahasiswa - Prodi S1 Teknik Informatika',
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      color: Colors.amber[200],
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Mata Kuliah Hari Ini',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            _ScheduleItem('Kota Cerdas', '09.00–10.00'),
            _ScheduleItem('Sistem Operasi', '10.30–11.00'),
            _ScheduleItem('Pemrograman Seluler', '14.00–15.00'),
          ],
        ),
      ),
    );
  }

  Widget _buildAnnouncementCard() {
    return Card(
      color: Colors.teal[100],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('📢 Pengumuman',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'Input Biodata Mahasiswa Baru\n\n'
              'Assalamu’alaikum Wr. Wb. Diberitahukan kepada mahasiswa IINU Sunan Giri Bojonegoro untuk segera melengkapi Biodata di SIM selengkap-lengkapnya karena nantinya akan menjadi acuan input data di laman...',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              'Selengkapnya...',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String title) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1E534F),
        padding: const EdgeInsets.symmetric(vertical: 12),
        foregroundColor: Colors.white,
      ),
      onPressed: () {},
      child: Center(child: Text(title)),
    );
  }

  Widget _buildSystemIcons() {
    final icons = [
      Icons.school,
      Icons.email,
      Icons.calendar_today,
      Icons.video_call,
      Icons.assessment,
      Icons.folder,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: icons
          .map((icon) => Icon(icon, size: 32, color: const Color(0xFF1E534F)))
          .toList(),
    );
  }
}

class _ScheduleItem extends StatelessWidget {
  final String course;
  final String time;

  const _ScheduleItem(this.course, this.time);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(course),
          Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
