import 'package:flutter/material.dart';
import 'package:moch_s_application/presentation/sim_login_screen/sim_login_screen.dart';
import 'package:moch_s_application/presentation/dashboard/dashboard_screen.dart';

class ResetPasswordDrawer extends StatefulWidget {
  final String username;
  const ResetPasswordDrawer({super.key, required this.username});

  @override
  State<ResetPasswordDrawer> createState() => _ResetPasswordDrawerState();
}

class _ResetPasswordDrawerState extends State<ResetPasswordDrawer> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void _submitNewPassword() {
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      _showMessage("Semua kolom harus diisi");
      return;
    }

    if (newPassword != confirmPassword) {
      _showMessage("Password tidak cocok");
      return;
    }

    // TODO: Kirim password baru ke server

    _showMessage("Password berhasil diubah", success: true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => SimLoginScreen()),
    );
  }

  void _showMessage(String message, {bool success = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => DashboardScreen(username: widget.username),
              ),
            );
          },
        ),
        title: const Text(
          "Lupa Kata Sandi",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Logo
            Image.asset(
                'assets/images/img_as6134232137277451523262899371l_1.png',
                width: 70,
                height: 70),
            const SizedBox(height: 10),
            const Text(
              "SIM UNUGIRI",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E534F),
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Enter new password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              "Your new password must be different\nfrom previously used password.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 30),

            // Input New Password
            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "New password",
                hintText: "Masukkan password baru",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Confirm Password
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Confirm password",
                hintText: "Masukkan ulang password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            // Tombol Continue
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitNewPassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade300,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const Spacer(),
            const Text("Powered by: Kelompok 5",
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
