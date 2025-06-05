import 'package:flutter/material.dart';
import 'package:moch_s_application/presentation/password/otp_verification_screen.dart';
import 'package:moch_s_application/presentation/sim_login_screen/sim_login_screen.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SimLoginScreen()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Logo SIM UNUGIRI
              Column(
                children: [
                  Image.asset(
                    'assets/images/img_as6134232137277451523262899371l_1.png', // ganti path sesuai struktur asetmu
                    width: 70,
                    height: 70,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "SIM UNUGIRI",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Color(0xFF1E534F),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Judul
              const Text(
                "Mail Address Here",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Masukkan Email anda untuk mengatur ulang kata sandi",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Input Email
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "E-Mail",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Masukkan alamat email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),

              // Tombol Recovery Password
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Implementasikan logika reset password
                    final enteredEmail = emailController.text;
                    if (enteredEmail.isEmpty || !enteredEmail.contains('@')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Masukkan alamat email yang valid")),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpVerificationScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade300,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 3,
                  ),
                  child: const Text(
                    "Recovery Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              const Spacer(),

              // Footer
              const Text("Powered by: Kelompok 5",
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
