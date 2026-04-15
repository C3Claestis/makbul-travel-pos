// ignore_for_file: use_build_context_synchronously, sort_child_properties_last

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/main_page.dart';
import 'package:makbul_app/page/register_page.dart';
import 'package:makbul_app/provider/auth_provider.dart';
import 'package:makbul_app/service/mock_backend_service.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  String selectedRole = 'jamaah'; // Variabel untuk menyimpan pilihan role

  Future<void> login() async {
    setState(() => isLoading = true);

    try {
      final authService = ref.read(authServiceProvider);

      final user = await authService.loginWithEmail(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        // --- VERIFIKASI ROLE DI DATABASE DUMMY ---
        final backendService = ref.read(mockBackendProvider);
        final userData = backendService.allUsers.firstWhere(
          (u) => u.firebaseUid == user.uid,
          orElse: () => DummyUserModel(id: -1, firebaseUid: '', name: '', email: '', role: '', authProvider: ''),
        );

        // Jika user tidak ditemukan atau role tidak sesuai dengan yang dipilih (_cardMulti)
        if (userData.id == -1 || userData.role != selectedRole) {
          await FirebaseAuth.instance.signOut(); // Logout kembali dari Firebase
          if (!mounted) return;
          
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Akses ditolak: Akun Anda tidak terdaftar dengan role tersebut.")),
          );
          setState(() => isLoading = false);
          return; // Batalkan proses masuk
        }

        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(),
      body: _form(context),
    );
  }

  Container _form(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff74EFD2), Color(0xff428979)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    "Masuk",
                    style: GoogleFonts.outfit(
                      fontSize: 40,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _cardMulti("Jamaah", 'jamaah')),
                      const SizedBox(width: 8),
                      Expanded(child: _cardMulti("Agen", 'agent')),
                      const SizedBox(width: 8),
                      Expanded(child: _cardMulti("Biro Travel", 'travel')),
                    ],
                  ),
                  const SizedBox(height: 40),
                  fieldlogin(emailController, 'Email'),
                  const SizedBox(height: 16),
                  fieldlogin(passwordController, 'Password'),
                  const SizedBox(height: 24),

                  /// BUTTON LOGIN
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : login,
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : Text(
                              "Masuk",
                              style: GoogleFonts.notoSansJp(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff23762C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Masuk Dengan',
                    style: GoogleFonts.notoSansJp(
                      color: Color(0xffA5A5A5),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final authService = ref.read(authServiceProvider);
                          final user = await authService.loginGoogle();
                          if (user != null) {
                            // Verifikasi Role untuk Google Login
                            final backendService = ref.read(mockBackendProvider);
                            final userData = backendService.allUsers.firstWhere(
                              (u) => u.firebaseUid == user.uid,
                              orElse: () => DummyUserModel(id: -1, firebaseUid: '', name: '', email: '', role: '', authProvider: ''),
                            );

                            if (userData.id == -1 || userData.role != selectedRole) {
                              await FirebaseAuth.instance.signOut();
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Akses ditolak: Role akun tidak sesuai.")),
                              );
                              return;
                            }

                            if (!mounted) return;
                            // Pindah ke halaman Home jika berhasil login
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainPage(),
                              ),
                            );
                          }
                        },
                        child: SvgPicture.asset('assets/svgs/logo_google.svg'),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () async {
                          final authService = ref.read(authServiceProvider);
                          final user = await authService.signInWithFacebook();
                          if (user != null) {
                            // Verifikasi Role untuk Facebook Login
                            final backendService = ref.read(mockBackendProvider);
                            final userData = backendService.allUsers.firstWhere(
                              (u) => u.firebaseUid == user.uid,
                              orElse: () => DummyUserModel(id: -1, firebaseUid: '', name: '', email: '', role: '', authProvider: ''),
                            );

                            if (userData.id == -1 || userData.role != selectedRole) {
                              await FirebaseAuth.instance.signOut();
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Akses ditolak: Role akun tidak sesuai.")),
                              );
                              return;
                            }

                            if (!mounted) return;
                            // Pindah ke halaman Home jika berhasil login
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainPage(),
                              ),
                            );
                          }
                        },
                        child: SvgPicture.asset('assets/svgs/logo_fb.svg'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  /// BUTTON REGISTER
                  RichText(
                    text: TextSpan(
                      text: 'Belum punya akun? ',
                      style: GoogleFonts.notoSansJp(
                        color: Color(0xffA5A5A5),
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'Register',
                          style: GoogleFonts.notoSansJp(
                            color: Color(0xff23762C),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _cardMulti(String text, String svg) {
    bool isSelected = selectedRole == svg;
    const primaryGreen = Color(0xff23762C);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = svg;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? Colors.white : primaryGreen,
          border: isSelected ? Border.all(color: primaryGreen, width: 2) : null,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/svgs/${svg}_btn_login.svg',
              height: 64,
              colorFilter: ColorFilter.mode(
                isSelected ? primaryGreen : Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSansJp(
                color: isSelected ? primaryGreen : Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField fieldlogin(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        labelText: label,
        labelStyle: GoogleFonts.notoSansJp(
          color: Color(0xffA5A5A5),
          fontSize: 12,
        ),
        fillColor: Color(0xffF3F3F3),
        filled: true,
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'MAKBUL',
        style: GoogleFonts.inter(
          fontSize: 40,
          color: Color(0xff23762C),
          fontWeight: FontWeight.w900,
          letterSpacing: 5,
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
