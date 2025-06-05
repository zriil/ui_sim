import 'package:flutter/material.dart';
import 'package:moch_s_application/presentation/dashboard/dashboard_screen.dart';
import 'package:moch_s_application/presentation/password/forgot_password_screen.dart';

class SimLoginScreen extends StatelessWidget {
  final TextEditingController nimController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SimLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background warna utama
          Positioned.fill(
            child: Container(color: const Color(0xFF36D6C9)),
          ),

          // Gradasi atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.55,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF36D6C9), Color(0xFF319CA6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          // Gambar gedung background
          Positioned.fill(
            child: Image.asset(
              'assets/images/img_chatgpt_image_24_apr_2025_004952_2.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),

          // Overlay gradasi supaya teks tetap terbaca
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.55,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xCC36D6C9), Color(0xCC319CA6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          // Gambar mahasiswa (foreground)
          Positioned(
            top: screenHeight * 0.12,
            right: 0,
            child: Image.asset(
              'assets/images/img_screenshot20250424003612removebgpreview_1.png',
              height: screenHeight * 0.45,
              fit: BoxFit.cover,
            ),
          ),

          // Logo kampus
          Positioned(
            top: 60,
            left: 20,
            child: Image.asset(
              'assets/images/img_as6134232137277451523262899371l_1.png',
              height: 100,
              width: 100,
            ),
          ),

          // Teks SIM
          const Positioned(
            top: 140,
            left: 20,
            child: Text(
              'SIM',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          // Subjudul
          const Positioned(
            top: 240,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SISTEM INFORMASI MANAGEMENT',
                  style: TextStyle(fontSize: 12, color: Colors.yellow),
                ),
                Text(
                  'UNIVERSITAS NAHDLATUL ULAMA SUNAN GIRI',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ],
            ),
          ),

          // Vector gelombang bawah
          Positioned(
            top: screenHeight * 0.42,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/img_vector_1.png',
              width: screenWidth,
              fit: BoxFit.cover,
            ),
          ),

          // Form Login
          Positioned(
            top: screenHeight * 0.53,
            left: 30,
            right: 30,
            child: Column(
              children: [
                const Text(
                  'HELLO,\nSIGN IN INTO YOUR ACCOUNT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Input NIM
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 4)
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFF0BA3A3),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10)),
                        ),
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                      Expanded(
                        child: TextField(
                          controller: nimController,
                          decoration: const InputDecoration(
                            hintText: 'Nomor Induk Mahasiswa',
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Input Password
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 4)
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFF0BA3A3),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10)),
                        ),
                        child: const Icon(Icons.lock, color: Colors.white),
                      ),
                      Expanded(
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Tombol "Lupa Password"
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPassword()),
                      );
                    },
                    child: const Text(
                      'Lupa Password?',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),

                // Tombol Login
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD65C),
                    minimumSize: const Size(120, 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {
                    String nim = nimController.text.trim();
                    String password = passwordController.text.trim();

                    if (nim.isNotEmpty && password.isNotEmpty) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DashboardScreen(username: nim),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('NIM dan Password wajib diisi'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 16),

                // Info versi
                const Text(
                  'Version: SIM_V24[8.9]',
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ],
            ),
          ),

          // Footer
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 55,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF36D6C9), Color(0xFF319CA6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Text(
                  'Powered by: Kelompok 5',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
