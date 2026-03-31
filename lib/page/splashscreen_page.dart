import 'package:flutter/material.dart';
import 'package:makbul_app/page/login_page.dart';

// Ganti 'NextPage' dengan halaman tujuanmu yang sebenarnya
// import 'package:nama_project/pages/next_page.dart'; 

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({super.key});

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {
    // Memberikan jeda waktu selama 3 detik
    await Future.delayed(const Duration(seconds: 3));

    // Memastikan widget masih aktif sebelum melakukan navigasi (Best Practice)
    if (!mounted) return;

    // Pindah ke halaman selanjutnya dan hapus splash screen dari tumpukan navigasi
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(), 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}