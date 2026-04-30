import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/login_screen.dart';
import 'onboarding/permissions_screen.dart';
import 'main_layout.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 5), () async {
      if (!mounted) return;
      
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      final onboardingDone = prefs.getBool('onboardingDone') ?? false;

      Widget nextScreen;
      if (!isLoggedIn) {
        nextScreen = const LoginScreen();
      } else if (!onboardingDone) {
        nextScreen = const PermissionsScreen();
      } else {
        nextScreen = const MainLayout();
      }

      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => nextScreen,
            transitionsBuilder: (_, anim, __, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 600),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // ── Vignette rojo sutil ──────────────────────────
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.2,
                  colors: [
                    AppColors.primary.withOpacity(0.12),
                    AppColors.background,
                  ],
                ),
              ),
            ),
          ),

          // ── Contenido centrado ───────────────────────────
          SafeArea(
            child: Column(
              children: [
                const Spacer(),

                // Logo con pulso
                FadeInDown(
                  duration: const Duration(milliseconds: 700),
                  child: AnimatedBuilder(
                    animation: _pulseAnimation,
                    builder: (_, child) => Transform.scale(
                      scale: _pulseAnimation.value,
                      child: child,
                    ),
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.surface,
                        border: Border.all(color: AppColors.border, width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.35),
                            blurRadius: 48,
                            spreadRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.shield,
                        color: AppColors.primary,
                        size: 60,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Título
                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  duration: const Duration(milliseconds: 600),
                  child: const Text(
                    'AlertaYA',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Subtítulo
                FadeInUp(
                  delay: const Duration(milliseconds: 350),
                  duration: const Duration(milliseconds: 600),
                  child: const Text(
                    'Tu seguridad, en un toque.',
                    style: TextStyle(
                      color: AppColors.hint,
                      fontSize: 16,
                    ),
                  ),
                ),

                const Spacer(),

                // Bottom row
                FadeIn(
                  delay: const Duration(milliseconds: 500),
                  duration: const Duration(milliseconds: 700),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 36.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 2,
                          color: AppColors.primary.withOpacity(0.6),
                        ),
                        const SizedBox(width: 12),
                        const Icon(
                          Icons.lock_outlined,
                          color: AppColors.hint,
                          size: 14,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'SECURED BY SENTINEL',
                          style: TextStyle(
                            color: AppColors.hint,
                            fontSize: 10,
                            letterSpacing: 2.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 36,
                          height: 2,
                          color: AppColors.primary.withOpacity(0.6),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
