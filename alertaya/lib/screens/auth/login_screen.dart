import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'register_screen.dart';
import '../main_layout.dart';
import '../../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const MainLayout(),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 500),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                // ── Logo pequeño ───────────────────────────
                FadeInDown(
                  duration: const Duration(milliseconds: 500),
                  child: Row(
                    children: [
                      const Icon(Icons.shield,
                          color: AppColors.primary, size: 28),
                      const SizedBox(width: 8),
                      const Text(
                        'AlertaYA',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // ── Título y subtítulo ─────────────────────
                FadeInLeft(
                  delay: const Duration(milliseconds: 100),
                  duration: const Duration(milliseconds: 500),
                  child: const Text(
                    'AlertaYA',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                FadeInLeft(
                  delay: const Duration(milliseconds: 180),
                  duration: const Duration(milliseconds: 500),
                  child: const Text(
                    'Protección de alto nivel para lo que\nmás importa.',
                    style: TextStyle(
                      color: AppColors.hint,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 48),

                // ── Campo EMAIL ───────────────────────────
                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'EMAIL',
                        style: TextStyle(
                          color: AppColors.hint,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: AppColors.white),
                        decoration: const InputDecoration(
                          hintText: 'nombre@ejemplo.com',
                          prefixIcon:
                              Icon(Icons.mail_outline, color: AppColors.hint),
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Ingresa tu correo';
                          }
                          if (!v.contains('@')) return 'Correo inválido';
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // ── Campo PASSWORD ────────────────────────
                FadeInUp(
                  delay: const Duration(milliseconds: 280),
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'PASSWORD',
                        style: TextStyle(
                          color: AppColors.hint,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        style: const TextStyle(color: AppColors.white),
                        decoration: InputDecoration(
                          hintText: '••••••••',
                          prefixIcon: const Icon(Icons.lock_outline,
                              color: AppColors.hint),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.hint,
                            ),
                            onPressed: () => setState(
                                () => _obscurePassword = !_obscurePassword),
                          ),
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Ingresa tu contraseña';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                // ── Olvidé contraseña ─────────────────────
                FadeInUp(
                  delay: const Duration(milliseconds: 340),
                  duration: const Duration(milliseconds: 500),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: AppColors.hint),
                      child: const Text('Olvidé mi contraseña'),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // ── Botón Iniciar sesión ───────────────────
                FadeInUp(
                  delay: const Duration(milliseconds: 400),
                  duration: const Duration(milliseconds: 500),
                  child: ElevatedButton(
                    onPressed: _onLogin,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Iniciar sesión'),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, size: 18),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // ── Crear cuenta ──────────────────────────
                FadeInUp(
                  delay: const Duration(milliseconds: 460),
                  duration: const Duration(milliseconds: 500),
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          '¿No tienes una cuenta?',
                          style: TextStyle(color: AppColors.hint, fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const RegisterScreen()),
                            );
                          },
                          child: const Text('Crear cuenta'),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 48),

                // ── Biometría ─────────────────────────────
                FadeIn(
                  delay: const Duration(milliseconds: 520),
                  duration: const Duration(milliseconds: 600),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'O accede con',
                          style: TextStyle(color: AppColors.hint, fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildBiometricBtn(
                            icon: Icons.fingerprint,
                            label: 'Huella',
                          ),
                          const SizedBox(width: 16),
                          _buildBiometricBtn(
                            icon: Icons.face,
                            label: 'Face ID',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBiometricBtn(
      {required IconData icon, required String label}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.hint, size: 32),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(color: AppColors.hint, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
