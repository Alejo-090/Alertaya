import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../theme/app_theme.dart';

class ActiveAlertScreen extends StatelessWidget {
  const ActiveAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Icon(Icons.shield_outlined, color: AppColors.primary, size: 24),
            SizedBox(width: 8),
            Text('AlertaYA', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.signal_cellular_alt, color: AppColors.primary), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Pulse(
                infinite: true,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                    boxShadow: [
                      BoxShadow(color: AppColors.primary.withOpacity(0.5), blurRadius: 40, spreadRadius: 10),
                    ],
                  ),
                  child: const Icon(Icons.emergency, color: Colors.white, size: 48),
                ),
              ),
              const SizedBox(height: 24),
              const Text('¡ALERTA ENVIADA!', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Enviando tu ubicación cada 30 segundos.', style: TextStyle(color: AppColors.hint, fontSize: 14)),
              
              const SizedBox(height: 32),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('GPS EN VIVO', style: TextStyle(color: AppColors.hint, fontSize: 10, letterSpacing: 1.0, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Icon(Icons.circle, color: AppColors.primary, size: 8),
                      SizedBox(width: 4),
                      Text('Transmitiendo', style: TextStyle(color: AppColors.primary, fontSize: 10)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    Container(width: 48, height: 48, color: Colors.grey[800], child: const Icon(Icons.map, color: Colors.white54)),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('4.7110° N, 74.0721° W', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          Text('Precisión: 5 metros', style: TextStyle(color: AppColors.hint, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('CONTACTOS NOTIFICADOS', style: TextStyle(color: AppColors.hint, fontSize: 10, letterSpacing: 1.0, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),
              _buildNotifiedContact('Elena Valdez', 'Madre', 'https://i.pravatar.cc/150?img=1'),
              _buildNotifiedContact('Ricardo Gomez', 'Padre', 'https://i.pravatar.cc/150?img=11'),
              _buildNotifiedContact('Mateo Valdez', 'Hermano', 'https://i.pravatar.cc/150?img=12'),
              
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primary, width: 2),
                    foregroundColor: AppColors.primary,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('CANCELAR ALERTA', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                ),
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.phone, color: AppColors.hint),
                label: const Text('Llamar al 123', style: TextStyle(color: AppColors.hint)),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotifiedContact(String name, String relation, String url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          CircleAvatar(radius: 16, backgroundImage: NetworkImage(url)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                Text(relation, style: const TextStyle(color: AppColors.hint, fontSize: 10)),
              ],
            ),
          ),
          const Icon(Icons.check_circle, color: AppColors.primary, size: 20),
        ],
      ),
    );
  }
}
