import 'package:flutter/material.dart';
import '../models/alert_event.dart';
import '../theme/app_theme.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final List<AlertEvent> events = [
    AlertEvent(
      title: 'Panic Signal Activated',
      subtitle: '(Home)',
      date: '12 OCT, 2023',
      time: '22:14',
      duration: '12m 04s',
      location: 'Av. Reforma 222, MX',
      status: '4 Contacts Notified',
      isCritical: true,
    ),
    AlertEvent(
      title: 'Safe Passage Timeout',
      subtitle: '',
      date: '08 OCT, 2023',
      time: '18:30',
      duration: '05m 00s',
      status: 'Automatically resolved by user input.',
      isCritical: false,
    ),
    AlertEvent(
      title: 'Motion Detected',
      subtitle: '(Home)',
      date: '01 OCT, 2023',
      time: '03:45',
      duration: '20m 15s',
      location: 'Residence: Safe Zone 1',
      status: 'Authorities Notified',
      isCritical: true,
    ),
  ];

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
          IconButton(icon: const Icon(Icons.filter_list, color: AppColors.white), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text('Alert History', style: TextStyle(color: AppColors.white, fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Review your past security events and notifications.', style: TextStyle(color: AppColors.hint, fontSize: 14)),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return _buildTimelineItem(events[index], isLast: index == events.length - 1);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineItem(AlertEvent event, {bool isLast = false}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline line and dot
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(top: 24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: event.isCritical ? AppColors.primary : AppColors.hint,
                  border: Border.all(color: AppColors.background, width: 4),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppColors.border,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          // Content Card
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        event.isCritical ? 'CRITICAL ALERT' : 'STANDARD CHECK',
                        style: TextStyle(
                          color: event.isCritical ? AppColors.primary : AppColors.hint,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                      Text(event.date, style: const TextStyle(color: AppColors.hint, fontSize: 10)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.title,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  if (event.subtitle.isNotEmpty)
                    Text(
                      event.subtitle,
                      style: const TextStyle(color: AppColors.hint, fontSize: 14),
                    ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('TIME & DURATION', style: TextStyle(color: AppColors.hint, fontSize: 8, letterSpacing: 1.0)),
                          const SizedBox(height: 4),
                          Text('${event.time} • ${event.duration}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('CONTACTS NOTIFIED', style: TextStyle(color: AppColors.hint, fontSize: 8, letterSpacing: 1.0)),
                          const SizedBox(height: 4),
                          Text(event.status, style: const TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  if (event.location != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          const Center(child: Icon(Icons.map, color: Colors.white24, size: 48)),
                          Positioned(
                            bottom: 8,
                            left: 8,
                            child: Row(
                              children: [
                                const Icon(Icons.location_on, color: AppColors.primary, size: 16),
                                const SizedBox(width: 4),
                                Text(event.location!, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
