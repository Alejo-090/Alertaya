import 'package:flutter/material.dart';
import 'voice_setup_screen.dart';
import '../../theme/app_theme.dart';

class AddContactsScreen extends StatelessWidget {
  const AddContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.shield_outlined, color: AppColors.primary, size: 24),
            const SizedBox(width: 8),
            const Text('AlertaYA', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.help_outline, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Contactos', style: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('Paso 2 de 2', style: TextStyle(color: AppColors.hint, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 8),
              Container(height: 2, color: AppColors.primary),
              const SizedBox(height: 24),
              
              Text('NOMBRE DEL CONTACTO', style: TextStyle(color: AppColors.hint, fontSize: 10, letterSpacing: 1.0)),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(hintText: 'Ej. María García'),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              
              Text('NÚMERO DE TELÉFONO', style: TextStyle(color: AppColors.hint, fontSize: 10, letterSpacing: 1.0)),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(hintText: '+57 300 000 0000'),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 24),
              
              ElevatedButton.icon(
                icon: const Icon(Icons.add_circle_outline),
                label: const Text('Agregar contacto'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.info_outline, color: AppColors.primary, size: 14),
                  const SizedBox(width: 4),
                  Text('Mínimo 1 contacto requerido', style: TextStyle(color: AppColors.primary.withOpacity(0.8), fontSize: 12)),
                ],
              ),
              
              const SizedBox(height: 40),
              const Text('Contactos Agregados', style: TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              
              _buildContactItem('Elena Rodríguez', '+57 312 445 6677'),
              const SizedBox(height: 12),
              _buildContactItem('Carlos Mendoza', '+57 300 123 4455'),
              
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.surface, foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const VoiceSetupScreen()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Continuar'),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Configurar más tarde', style: TextStyle(color: AppColors.hint)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem(String name, String phone) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 20, backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=5')),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text(phone, style: const TextStyle(color: AppColors.hint, fontSize: 12)),
              ],
            ),
          ),
          IconButton(icon: const Icon(Icons.delete_outline, color: AppColors.hint), onPressed: () {}),
        ],
      ),
    );
  }
}
