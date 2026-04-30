import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../onboarding/permissions_screen.dart';
import '../../theme/app_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onRegister() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const PermissionsScreen(),
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: AppColors.white),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.shield_outlined, color: AppColors.primary, size: 22),
            SizedBox(width: 8),
            Text(
              'AlertaYA',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),

                // ── Título ────────────────────────────────
                FadeInLeft(
                  duration: const Duration(milliseconds: 500),
                  child: const Text(
                    'Crear cuenta',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                FadeInLeft(
                  delay: const Duration(milliseconds: 80),
                  duration: const Duration(milliseconds: 500),
                  child: const Text(
                    'Únete a la red de seguridad más avanzada.\nTu protección es nuestra prioridad.',
                    style: TextStyle(
                      color: AppColors.hint,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // ── Nombre completo ───────────────────────
                _buildLabeledField(
                  label: 'NOMBRE COMPLETO',
                  animDelay: 150,
                  child: TextFormField(
                    controller: _nameController,
                    style: const TextStyle(color: AppColors.white),
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      hintText: 'Tu nombre completo',
                      prefixIcon:
                          Icon(Icons.person_outline, color: AppColors.hint),
                    ),
                    validator: (v) =>
                        (v == null || v.isEmpty) ? 'Ingresa tu nombre' : null,
                  ),
                ),

                const SizedBox(height: 16),

                // ── Correo ────────────────────────────────
                _buildLabeledField(
                  label: 'CORREO ELECTRÓNICO',
                  animDelay: 220,
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: AppColors.white),
                    decoration: const InputDecoration(
                      hintText: 'nombre@ejemplo.com',
                      prefixIcon:
                          Icon(Icons.mail_outline, color: AppColors.hint),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Ingresa tu correo';
                      if (!v.contains('@')) return 'Correo inválido';
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // ── Teléfono ──────────────────────────────
                _buildLabeledField(
                  label: 'NÚMERO DE TELÉFONO',
                  animDelay: 290,
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(color: AppColors.white),
                    decoration: const InputDecoration(
                      hintText: '+52 000 000 0000',
                      prefixIcon:
                          Icon(Icons.phone_outlined, color: AppColors.hint),
                    ),
                    validator: (v) =>
                        (v == null || v.isEmpty) ? 'Ingresa tu teléfono' : null,
                  ),
                ),

                const SizedBox(height: 16),

                // ── Contraseña ────────────────────────────
                _buildLabeledField(
                  label: 'CONTRASEÑA',
                  animDelay: 360,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: const TextStyle(color: AppColors.white),
                    decoration: InputDecoration(
                      hintText: '••••••••',
                      prefixIcon:
                          const Icon(Icons.lock_outline, color: AppColors.hint),
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
                      if (v == null || v.isEmpty) return 'Ingresa una contraseña';
                      if (v.length < 8) return 'Mínimo 8 caracteres';
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // ── Aviso términos ────────────────────────
                FadeInUp(
                  delay: const Duration(milliseconds: 420),
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppColors.primary.withOpacity(0.25)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.info_outline,
                            color: AppColors.primary, size: 18),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Al registrarte, aceptas nuestros Términos de Servicio y Política de Privacidad. Tu información está cifrada de extremo a extremo.',
                            style: TextStyle(
                              color: AppColors.hint,
                              fontSize: 12,
                              height: 1.55,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // ── Botón Crear cuenta ────────────────────
                FadeInUp(
                  delay: const Duration(milliseconds: 480),
                  duration: const Duration(milliseconds: 500),
                  child: ElevatedButton(
                    onPressed: _onRegister,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Crear cuenta'),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, size: 18),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // ── Ya tengo cuenta ───────────────────────
                FadeIn(
                  delay: const Duration(milliseconds: 540),
                  duration: const Duration(milliseconds: 500),
                  child: Center(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style:
                          TextButton.styleFrom(foregroundColor: AppColors.hint),
                      child: const Text('Ya tengo cuenta'),
                    ),
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabeledField({
    required String label,
    required Widget child,
    int animDelay = 0,
  }) {
    return FadeInUp(
      delay: Duration(milliseconds: animDelay),
      duration: const Duration(milliseconds: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.hint,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
