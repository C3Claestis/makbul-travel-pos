// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makbul_app/page/main/main_page.dart';
import 'package:makbul_app/page/auth/providers/auth_provider.dart';

class VerifyEmailPage extends ConsumerStatefulWidget {
  final String email;

  const VerifyEmailPage({super.key, required this.email});

  @override
  ConsumerState<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends ConsumerState<VerifyEmailPage> {
  bool isChecking = false;

  Future<void> checkVerification() async {
    setState(() => isChecking = true);

    final authService = ref.read(authServiceProvider);
    final isVerified = await authService.isEmailVerified();

    if (isVerified) {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email belum diverifikasi")),
      );
    }

    setState(() => isChecking = false);
  }

  Future<void> resendEmail() async {
    final authService = ref.read(authServiceProvider);
    await authService.sendEmailVerification();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Email dikirim ulang")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verifikasi Email")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              "Link verifikasi sudah dikirim ke:\n${widget.email}",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: isChecking ? null : checkVerification,
              child: isChecking
                  ? const CircularProgressIndicator()
                  : const Text("Saya sudah verifikasi"),
            ),

            const SizedBox(height: 16),

            TextButton(
              onPressed: resendEmail,
              child: const Text("Kirim ulang email"),
            ),
          ],
        ),
      ),
    );
  }
}