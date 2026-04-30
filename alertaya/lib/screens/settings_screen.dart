import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/login_screen.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool voiceActivation = true;
  bool policeCallToggle = false;
  int smsInterval = 30; // 15, 30, 60

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.shield_outlined, color: AppColors.primary, size: 28),
            const SizedBox(width: 8),
            const Text('AlertaYA', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none, color: AppColors.white), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text('Settings', style: TextStyle(color: AppColors.white, fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Configure your emergency protocols and account.', style: TextStyle(color: AppColors.hint, fontSize: 14)),
              const SizedBox(height: 32),
              
              const Text('EMERGENCY PROTOCOLS', style: TextStyle(color: AppColors.hint, fontSize: 10, letterSpacing: 1.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              
              // Voice Activation
              _buildSettingCard(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.mic, color: AppColors.hint),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Voice Activation', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                const Text('Trigger alert with phrase', style: TextStyle(color: AppColors.hint, fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                        Switch(
                          value: voiceActivation,
                          activeColor: AppColors.primary,
                          onChanged: (val) => setState(() => voiceActivation = val),
                        ),
                      ],
                    ),
                    if (voiceActivation) ...[
                      const SizedBox(height: 16),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('KEYWORD PHRASE', style: TextStyle(color: AppColors.hint, fontSize: 10, letterSpacing: 1.0)),
                      ),
                      const SizedBox(height: 8),
                      const TextField(
                        decoration: InputDecoration(hintText: 'Auxilio'),
                        style: TextStyle(color: Colors.white),
                      ),
                    ]
                  ],
                ),
              ),
              const SizedBox(height: 12),
              
              // SMS Update Interval
              _buildSettingCard(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.timer_outlined, color: AppColors.hint),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('SMS Update Interval', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            const Text('Frequency of location updates', style: TextStyle(color: AppColors.hint, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _buildIntervalBtn(15),
                        const SizedBox(width: 8),
                        _buildIntervalBtn(30),
                        const SizedBox(width: 8),
                        _buildIntervalBtn(60),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              
              // Police Call Toggle
              _buildSettingCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.local_police_outlined, color: AppColors.primary),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Police Call Toggle', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            const Text('Auto-call 123 on activation', style: TextStyle(color: AppColors.hint, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    Switch(
                      value: policeCallToggle,
                      activeColor: AppColors.primary,
                      onChanged: (val) => setState(() => policeCallToggle = val),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              const Text('ACCOUNT & SECURITY', style: TextStyle(color: AppColors.hint, fontSize: 10, letterSpacing: 1.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              
              _buildActionTile(Icons.person_outline, 'Edit profile', 'Manage personal information'),
              _buildActionTile(Icons.lock_outline, 'Change password', 'Last changed 2 months ago'),
              _buildActionTile(Icons.logout, 'Logout', 'Sign out of your account', isDestructive: true),
              
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.shield, color: AppColors.primary, size: 32),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text('PREMIUM', style: TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('System Status: Active', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Your device is fully protected by AlertaYA high-frequency monitoring.',
                      style: TextStyle(color: AppColors.hint, fontSize: 12, height: 1.5),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              const Center(
                child: Text('ALERTAYA SENTINEL V2.4.1', style: TextStyle(color: AppColors.hint, fontSize: 10, letterSpacing: 2.0)),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );
  }

  Widget _buildIntervalBtn(int seconds) {
    final isSelected = smsInterval == seconds;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => smsInterval = seconds),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.background,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: isSelected ? AppColors.primary : AppColors.border),
          ),
          child: Center(
            child: Text(
              '${seconds}s',
              style: TextStyle(color: isSelected ? Colors.white : AppColors.hint, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionTile(IconData icon, String title, String subtitle,
      {bool isDestructive = false}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8)),
        child: Icon(icon,
            color: isDestructive ? AppColors.primary : AppColors.hint),
      ),
      title: Text(title,
          style: TextStyle(
              color: isDestructive ? AppColors.primary : Colors.white,
              fontWeight: FontWeight.bold)),
      subtitle:
          Text(subtitle, style: const TextStyle(color: AppColors.hint, fontSize: 12)),
      trailing: const Icon(Icons.chevron_right, color: AppColors.hint),
      onTap: isDestructive ? () => _confirmLogout() : () {},
    );
  }

  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.logout, color: AppColors.primary, size: 20),
            SizedBox(width: 10),
            Text('Cerrar sesión',
                style: TextStyle(color: AppColors.white, fontSize: 18)),
          ],
        ),
        content: const Text(
          '¿Estás seguro de que deseas cerrar sesión?',
          style: TextStyle(color: AppColors.hint, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            style: TextButton.styleFrom(foregroundColor: AppColors.hint),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(ctx);
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              if (mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const LoginScreen(),
                    transitionsBuilder: (_, anim, __, child) =>
                        FadeTransition(opacity: anim, child: child),
                    transitionDuration: const Duration(milliseconds: 500),
                  ),
                  (route) => false,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size.zero,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );
  }
}
