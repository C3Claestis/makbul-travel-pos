// ignore_for_file: use_build_context_synchronously, sort_child_properties_last

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/main_page.dart';
import 'package:makbul_app/page/login_page.dart';
import 'package:makbul_app/page/verify_email_page.dart';
import 'package:makbul_app/provider/auth_provider.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool isLoading = false;
  String selectedRole = 'jamaah';

  Future<void> register() async {
    setState(() => isLoading = true);

    try {
      final authService = ref.read(authServiceProvider);

      final user = await authService.registerWithEmail(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        if (!mounted) return;

        // 🔥 arahkan ke halaman verifikasi
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => VerifyEmailPage(email: user.email ?? ""),
          ),
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
        mainAxisAlignment: MainAxisAlignment.end,
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
                    "Daftar",
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
                  fieldlogin(nameController, 'Nama'),
                  const SizedBox(height: 16),
                  fieldlogin(emailController, 'Email'),
                  const SizedBox(height: 16),
                  fieldlogin(passwordController, 'Password'),
                  const SizedBox(height: 24),

                  /// BUTTON LOGIN
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : register,
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : Text(
                              "Daftar",
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
                    'Daftar Dengan',
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
                            if (!mounted) return;
                            // Pindah ke halaman Home jika berhasil login
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(),
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
                          await authService.loginGoogle();
                        },
                        child: SvgPicture.asset('assets/svgs/logo_fb.svg'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  /// BUTTON REGISTER
                  RichText(
                    text: TextSpan(
                      text: 'Sudah punya akun? ',
                      style: GoogleFonts.notoSansJp(
                        color: Color(0xffA5A5A5),
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'Masuk',
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
                                  builder: (context) => const LoginPage(),
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
