// ignore_for_file: use_build_context_synchronously, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/main_page.dart';
import 'package:makbul_app/page/auth/pages/register_page.dart';
import 'package:makbul_app/page/auth/providers/auth_provider.dart';

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
      final firestore = FirebaseFirestore.instance;

      final user = await authService.loginWithEmail(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user == null) throw Exception("Login gagal");

      // 🔥 AMBIL DATA DARI FIRESTORE
      final doc = await firestore.collection('users').doc(user.uid).get();
      final userData = doc.data();

      if (userData == null || userData['role'] != selectedRole) {
        await FirebaseAuth.instance.signOut();

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Akses ditolak: Role tidak sesuai")),
        );
        return;
      }

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
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
                  fieldlogin(ref, emailController, 'Email'),
                  const SizedBox(height: 16),
                  fieldlogin(ref, passwordController, 'Password', obscureText: true),
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
                      googlelogin(context),
                      const SizedBox(width: 16),
                      fblogin(context),
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

  GestureDetector googlelogin(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final authService = ref.read(authServiceProvider);
        final firestore = FirebaseFirestore.instance;

        final user = await authService.loginGoogle();

        if (user == null) return;

        final doc = await firestore.collection('users').doc(user.uid).get();
        final userData = doc.data();

        // 🔥 AMBIL DATA DARI FIRESTOR
        if (userData == null || userData['role'] != selectedRole) {
          await FirebaseAuth.instance.signOut();
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Akses ditolak: Role tidak sesuai")),
          );
          return;
        }

        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainPage()),
        );
      },
      child: SvgPicture.asset('assets/svgs/logo_google.svg'),
    );
  }

  GestureDetector fblogin(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final authService = ref.read(authServiceProvider);
        final firestore = FirebaseFirestore.instance;

        final user = await authService.signInWithFacebook();
        if (user == null) return;

        final doc = await firestore.collection('users').doc(user.uid).get();
        final userData = doc.data();

        if (userData == null || userData['role'] != selectedRole) {
          await FirebaseAuth.instance.signOut();
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Akses ditolak: Role tidak sesuai")),
          );
          return;
        }

        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainPage()),
        );
      },
      child: SvgPicture.asset('assets/svgs/logo_fb.svg'),
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

  TextFormField fieldlogin(
    WidgetRef ref,
    TextEditingController controller,
    String label, {
    bool obscureText = false,
  }) {
    final passwordVisibility = ref.watch(loginVisibilityProvider);

    return TextFormField(
      controller: controller,
      obscureText: obscureText ? passwordVisibility : false,
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

        // 🔥 ICON SHOW / HIDE
        suffixIcon: obscureText
            ? IconButton(
                icon: Icon(
                  passwordVisibility ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  ref.read(loginVisibilityProvider.notifier).state =
                      !passwordVisibility;
                },
              )
            : null,
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
