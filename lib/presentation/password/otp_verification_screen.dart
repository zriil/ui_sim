import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moch_s_application/presentation/password/forgot_password_screen.dart';
import 'package:moch_s_application/presentation/password/reset_password_screen.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> otpControllers =
        List.generate(4, (_) => TextEditingController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ForgotPassword()),
          ),
        ),
        title: const Text(
          'Lupa Kata Sandi',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Logo dan Judul
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
              "Get Your Code",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              "please enter the 4 digit code that\nsend to your email address",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 30),

            // Input OTP
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60,
                  child: TextField(
                    controller: otpControllers[index],
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 3) {
                        FocusScope.of(context).nextFocus();
                      }

                      // Auto-submit jika semua sudah diisi
                      final isAllFilled =
                          otpControllers.every((c) => c.text.trim().isNotEmpty);
                      if (isAllFilled) {
                        final code =
                            otpControllers.map((c) => c.text.trim()).join();
                        if (code.length == 4) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ResetPasswordScreen()),
                          );
                        }
                      }
                    },
                  ),
                );
              }),
            ),

            const SizedBox(height: 16),

            // Resend Code
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("if you don’t receive code? "),
                TextButton(
                  onPressed: () {
                    // TODO: Kirim ulang kode
                  },
                  child: const Text(
                    "Resend",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Tombol Verifikasi
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final code = otpControllers.map((c) => c.text.trim()).join();

                  final isAllFilled =
                      otpControllers.every((c) => c.text.trim().isNotEmpty);

                  if (isAllFilled && code.length == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ResetPasswordScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Masukkan 4 digit kode angka")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade300,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Verify and Proceed",
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
