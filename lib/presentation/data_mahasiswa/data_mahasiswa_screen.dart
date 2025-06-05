import 'package:flutter/material.dart';
import 'package:moch_s_application/widgets/custom_drawer.dart';

class DataMahasiswaScreen extends StatelessWidget {
  final String username;

  const DataMahasiswaScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(username: username),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E534F),
        title: const Text('Data Mahasiswa'),
      ),
      backgroundColor: Colors.teal.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Foto dan Nama Mahasiswa
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/profile.jpg"), // Ganti dengan path lokal kamu
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Mambaul Chiqmah\n231010050 - Prodi S1 Teknik Informatika',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),

              // Data Mahasiswa
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    InfoItem(label: "NIM", value: "231010"),
                    InfoItem(label: "Nama Mahasiswa", value: "Salsabila PDN"),
                    InfoItem(label: "Dosen Wali", value: "Mufa Agung Barata"),
                    InfoItem(label: "Fakultas", value: "Sains dan Teknologi"),
                    InfoItem(label: "Prodi", value: "Teknik Informatika"),
                    InfoItem(label: "Periode Daftar", value: "Semester Gasal 2023"),
                    InfoItem(label: "Kurikulum Mahasiswa", value: "2021"),
                    InfoItem(label: "Status Mahasiswa", value: "Aktif"),
                    Divider(),
                    InfoItem(label: "Semester", value: "4"),
                    InfoItem(label: "Batas SKS", value: "24"),
                    InfoItem(label: "SKS Lulus", value: "59"),
                    InfoItem(label: "IPK", value: "3.80"),
                    InfoItem(label: "IPS Lalu", value: "3.90"),
                    InfoItem(label: "Cuti", value: "0"),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aksi untuk edit data
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade300,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  elevation: 2,
                ),
                child: const Text("Edit", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              const Text('Powered by: Kelompok 5', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const InfoItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$label",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
