import 'package:flutter/material.dart';
import 'package:moch_s_application/presentation/dashboard/dashboard_screen.dart';
import 'package:moch_s_application/presentation/Perkuliahan/perkuliahan_screen.dart';
import 'package:moch_s_application/presentation/password/reset_password_drawer.dart';
import 'package:moch_s_application/presentation/sim_login_screen/sim_login_screen.dart';
import 'package:moch_s_application/presentation/data_mahasiswa/data_mahasiswa_screen.dart';
import 'package:moch_s_application/presentation/laporan/laporan_screen.dart';
import 'package:moch_s_application/presentation/spekma/new_speekma_screen.dart';
import 'package:moch_s_application/presentation/yudisium/yudisium_screen.dart';

class CustomDrawer extends StatelessWidget {
  final String username;

  const CustomDrawer({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF1E534F),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/img_as6134232137277451523262899371l_1.png',
                    height: 60,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'SIM UNUGIRI',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(context, 'Dashboard', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DashboardScreen(username: username),
                ),
              );
            }),
            _buildDrawerItem(context, 'Perkuliahan', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PerkuliahanScreen(username: username),
                ),
              );
            }),
            _buildDrawerItem(context, 'Laporan', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LaporanScreen(username: username),
                ),
              );
            }),
            _buildDrawerItem(context, 'Yudisium', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => YudisiumScreen(username: username),
                ),
              );
            }),
            _buildDrawerItem(context, 'New SPEKMA', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => NewSpekmaScreen(username: username),
                ),
              );
            }),
            _buildDrawerItem(context, 'Data Mahasiswa', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DataMahasiswaScreen(username: username),
                ),
              );
            }),
            const Divider(color: Colors.white70),
            _buildDrawerItem(context, 'Ganti Password', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ResetPasswordDrawer(username: username),
                ),
              );
            }),
            _buildDrawerItem(context, 'Logout', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SimLoginScreen(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title,
      [VoidCallback? onTap]) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: onTap ?? () {},
    );
  }
}
