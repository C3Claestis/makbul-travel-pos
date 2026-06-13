// ignore_for_file: use_build_context_synchronously, sort_child_properties_last, deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/features/auth/presentation/pages/login_page.dart';
import 'package:makbul_app/features/jamaah/presentation/pages/main_page.dart';
import 'package:makbul_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  int currentStep = 1;
  bool isChecking = false;

  bool isLoading = false;
  String selectedRole = 'jamaah';

  Future<void> register() async {
    setState(() => isLoading = true);

    try {
      final authService = ref.read(authServiceProvider);
      final firestore = FirebaseFirestore.instance;

      final user = await authService.registerWithEmail(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user == null) throw Exception("Register gagal");

      //// 🔥 SIMPAN KE FIRESTORE
      await firestore.collection('users').doc(user.uid).set({
        'name': nameController.text.trim(),
        'email': user.email ?? emailController.text.trim(),
        'role': selectedRole,
        'provider': 'email',
        'createdAt': FieldValue.serverTimestamp(),
      });

      if (!mounted) return;

      setState(() {
        currentStep = 2;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  Future<void> checkVerification() async {
    setState(() => isChecking = true);

    final authService = ref.read(authServiceProvider);
    final isVerified = await authService.isEmailVerified();

    if (isVerified) {
      if (!mounted) return;

      if (isVerified) {
        setState(() {
          currentStep = 3;
        });
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Email belum diverifikasi")));
    }

    setState(() => isChecking = false);
  }

  Future<void> resendEmail() async {
    final authService = ref.read(authServiceProvider);
    await authService.sendEmailVerification();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Email dikirim ulang")));
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
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: _appBar(),
      body: _form(context),
    );
  }

  Widget _form(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Buat akun baru sebagai",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    " Jamaah",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 0, 106, 4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Row(
                children: [
                  StepCircle(
                    number: 1,
                    isActive: currentStep == 1,
                    isCompleted: currentStep > 1,
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Divider()),
                  const SizedBox(width: 8),
                  StepCircle(
                    number: 2,
                    isActive: currentStep == 2,
                    isCompleted: currentStep > 2,
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Divider()),
                  const SizedBox(width: 8),
                  StepCircle(number: 3, isActive: currentStep == 3),
                ],
              ),
            ),
            const SizedBox(height: 32),

            //AREA FORM
            if (currentStep == 1)
              _form1(context)
            else if (currentStep == 2)
              _form2()
            else
              _form3(context),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Contoh untuk Google Login
                googleregister(context),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () async {
                    final authService = ref.read(authServiceProvider);
                    await authService.signInWithFacebook();
                  },
                  child: SvgPicture.asset('assets/svgs/logo_fb.svg'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _roleBanner(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Container _roleBanner() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffE5F8EB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Image.asset(
              'assets/images/regis-1.png',
              fit: BoxFit.contain,
            ),
          ),

          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daftar sebagai Jamaah',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Color(0xff23762C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Nikmati kemudahan ibadah bersama Makbul',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
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

  GestureDetector googleregister(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() => isLoading = true);

        try {
          final authService = ref.read(authServiceProvider);
          final firestore = FirebaseFirestore.instance;

          final user = await authService.loginGoogle();

          if (user == null) return;

          //// 🔥 SIMPAN KE FIRESTORE
          await firestore.collection('users').doc(user.uid).set({
            'name': nameController.text.trim(),
            'email': user.email ?? emailController.text.trim(),
            'role': selectedRole,
            'provider': 'email',
            'createdAt': FieldValue.serverTimestamp(),
          });

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
      },
      child: SvgPicture.asset('assets/svgs/logo_google.svg'),
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
        fillColor: const Color(0xffF5F5F5),
        filled: true,

        prefixIcon: Icon(
          label == 'Email'
              ? Icons.email
              : label == 'Password'
              ? Icons.lock
              : Icons.person,
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

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Daftar Akun',
        style: GoogleFonts.inter(
          fontSize: 26,
          color: Color(0xff23762C),
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
      ),
    );
  }

  Column _form1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Informasi Akun",
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        fieldlogin(ref, nameController, 'Nama'),
        const SizedBox(height: 16),
        fieldlogin(ref, emailController, 'Email'),
        const SizedBox(height: 16),
        fieldlogin(ref, passwordController, 'Password', obscureText: true),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          height: 46,
          child: TextButton(
            onPressed: isLoading ? null : register,
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
                    "Lanjutkan",
                    style: GoogleFonts.notoSansJp(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 16),

        /// BUTTON REGISTER
        Center(
          child: RichText(
            text: TextSpan(
              text: 'Sudah punya akun? ',
              style: GoogleFonts.notoSansJp(
                color: Color.fromARGB(255, 60, 60, 60),
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: 'Login',
                  style: GoogleFonts.notoSansJp(
                    color: roleColor,
                    fontSize: 14,
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
        ),
      ],
    );
  }

  Column _form2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Informasi Verifikasi",
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xffA5A5A5)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 24, bottom: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffE5F8EB),
                  ),
                  child: Image.asset(
                    'assets/images/mail.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  emailController.text.trim(),
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xff23762C),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Kami telah mengirim email verifikasi ke alamat email Anda',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Silahkan buka email dan klik tautan verifikasi yang telah kami kirim (buka spam jika belum muncul)',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 46,
          child: TextButton(
            onPressed: isChecking ? null : checkVerification,
            style: TextButton.styleFrom(
              backgroundColor: roleColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            ),
            child: isChecking
                ? const CircularProgressIndicator()
                : Text(
                    "Saya Sudah Verifikasi",
                    style: GoogleFonts.notoSansJp(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: RichText(
            text: TextSpan(
              text: 'Belum menerima email? ',
              style: GoogleFonts.notoSansJp(
                color: Color.fromARGB(255, 60, 60, 60),
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: 'Kirim Ulang',
                  style: GoogleFonts.notoSansJp(
                    color: roleColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => resendEmail(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column _form3(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Pendaftaran Berhasil',
            style: GoogleFonts.inter(
              fontSize: 20,
              color: Color(0xff23762C),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: SizedBox(
            width: 280,
            height: 220,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Bintang-bintang kecil
                const Positioned(top: 15, left: 50, child: Sparkle(size: 12)),
                const Positioned(top: 60, left: 25, child: Sparkle(size: 8)),
                const Positioned(bottom: 50, left: 30, child: Sparkle(size: 6)),
                const Positioned(top: 15, right: 60, child: Sparkle(size: 8)),
                const Positioned(top: 60, right: 30, child: Sparkle(size: 10)),
                const Positioned(
                  bottom: 50,
                  right: 35,
                  child: Sparkle(size: 8),
                ),
                const Positioned(left: 20, child: Sparkle(size: 8)),
                const Positioned(right: 20, child: Sparkle(size: 8)),

                // Lingkaran luar
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green.withOpacity(0.08),
                  ),
                ),

                // Lingkaran dalam
                Container(
                  width: 110,
                  height: 110,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),

                // Check Icon
                const Icon(
                  Icons.check_rounded,
                  size: 60,
                  color: Color(0xFF0A8F3E),
                ),
              ],
            ),
          ),
        ),
        Text(
          'Akun Jamaah Anda berhasil dibuat.',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Text(
            'Silahkan masuk untuk mulai menggunakan aplikasi.',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 46,
          child: TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
                (route) => false,
              );
            },
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
                    "Masuk Sekarang",
                    style: GoogleFonts.notoSansJp(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: RichText(
            text: TextSpan(
              text: 'Sudah punya akun? ',
              style: GoogleFonts.notoSansJp(
                color: Color.fromARGB(255, 60, 60, 60),
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: 'Login',
                  style: GoogleFonts.notoSansJp(
                    color: roleColor,
                    fontSize: 14,
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
        ),
      ],
    );
  }
}

class StepCircle extends StatelessWidget {
  final int number;
  final bool isActive;
  final bool isCompleted;

  const StepCircle({
    super.key,
    required this.number,
    this.isActive = false,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xff23762C);

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive || isCompleted ? primaryColor : Colors.grey.shade300,
      ),
      child: Center(
        child: isCompleted
            ? const Icon(Icons.check, size: 18, color: Colors.white)
            : Text(
                number.toString(),
                style: GoogleFonts.inter(
                  color: isActive ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}

class Sparkle extends StatelessWidget {
  final double size;

  const Sparkle({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.star, size: size, color: const Color(0xFF6DBE88));
  }
}
