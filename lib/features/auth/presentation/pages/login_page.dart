// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/features/auth/presentation/pages/register_page_copy.dart';

import '../../../jamaah/presentation/pages/main_page.dart';
import '../providers/auth_provider.dart';

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

      await user.reload();

      final updatedUser = FirebaseAuth.instance.currentUser;

      if (updatedUser == null || !updatedUser.emailVerified) {
        await FirebaseAuth.instance.signOut();

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Silakan verifikasi email terlebih dahulu"),
          ),
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

  Color get roleColor {
    switch (selectedRole) {
      case 'agen':
        return const Color(0xff075ECD);

      case 'biro_travel':
        return const Color(0xff6236B1);

      default:
        return const Color(0xff1C783B);
    }
  }

  String get roleImage {
    switch (selectedRole) {
      case 'agen':
        return "assets/images/agenIlus.png";

      case 'biro_travel':
        return "assets/images/travelIlus.png";

      default:
        return "assets/images/jamaahIlus.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      extendBodyBehindAppBar: true,

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                "MAKBUL",
                style: GoogleFonts.notoSansJp(
                  fontSize: 40,
                  color: roleColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "Masuk ke akun Anda",
                style: GoogleFonts.notoSansJp(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                ),
              ),
          
              const SizedBox(height: 24),
          
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: Image.asset(
                  roleImage,
                  key: ValueKey(roleImage),
                  height: 220,
                ),
              ),
          
              const SizedBox(height: 24),
          
              _formLogin(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formLogin(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _btnRole(
                        role: 'jamaah',
                        text: 'Jamaah',
                        icon: Icons.person,
                      ),

                      SizedBox(width: 8),
                      _btnRole(
                        role: 'agen',
                        text: 'Agen',
                        icon: Icons.support_agent,
                      ),
                      SizedBox(width: 8),
                      _btnRole(
                        role: 'biro_travel',
                        text: 'Travel',
                        icon: Icons.luggage,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _textLogin(),
                const SizedBox(height: 16),
                fieldlogin(ref, emailController, 'Email'),
                const SizedBox(height: 16),
                fieldlogin(
                  ref,
                  passwordController,
                  'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Lupa Password?",
                    style: GoogleFonts.notoSansJp(
                      fontSize: 12,
                      color: (roleColor),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _btnLogin(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: const Color(0xffA5A5A5),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "atau masuk dengan",
                      style: GoogleFonts.notoSansJp(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: const Color(0xffA5A5A5),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    googlelogin(context),
                    const SizedBox(width: 24),
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
                          color: roleColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPageCopy(),
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
      ),
    );
  }

  SizedBox _btnLogin() {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: TextButton(
        onPressed: isLoading ? null : login,
        style: TextButton.styleFrom(
          backgroundColor: roleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                "Masuk",
                style: GoogleFonts.notoSansJp(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }

  Row _textLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Login sebagai ",
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          selectedRole.toUpperCase().replaceAll('_', ' '),
          style: GoogleFonts.inter(
            fontSize: 12,
            color: roleColor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  Widget _btnRole({
    required String role,
    required String text,
    required IconData icon,
  }) {
    Color getRoleColor(String role) {
      switch (role) {
        case 'agen':
          return const Color(0xff075ECD);

        case 'biro_travel':
          return const Color(0xff6236B1);

        default:
          return const Color(0xff1C783B);
      }
    }

    final isSelected = selectedRole == role;
    final activeColor = getRoleColor(role);

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedRole = role;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? activeColor : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? activeColor : Colors.grey.shade300,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 30,
                color: isSelected ? Colors.white : Colors.black87,
              ),

              const SizedBox(height: 6),

              Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSansJp(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
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
          borderSide: BorderSide(width: 0.5, color: const Color(0xffA5A5A5)),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        labelText: label,
        labelStyle: GoogleFonts.inter(
          color: Color.fromARGB(255, 58, 55, 55),
          fontSize: 14,
        ),
        fillColor: Colors.white,
        filled: true,

        prefixIcon: Icon(
          label == 'Email' ? Icons.email : Icons.lock,
          color: Colors.black,
        ),
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
}
