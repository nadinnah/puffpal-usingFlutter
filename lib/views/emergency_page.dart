import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final steps = <({IconData icon, String title, String body})>[
      (icon: Icons.airline_seat_recline_normal, title: l10n.emStep1Title, body: l10n.emStep1Body),
      (icon: Icons.medication_liquid, title: l10n.emStep2Title, body: l10n.emStep2Body),
      (icon: Icons.monitor_heart, title: l10n.emStep3Title, body: l10n.emStep3Body),
      (icon: Icons.phone_in_talk, title: l10n.emStep4Title, body: l10n.emStep4Body),
      (icon: Icons.replay, title: l10n.emStep5Title, body: l10n.emStep5Body),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFC62828),
        foregroundColor: Colors.white,
        leading: const BackButton(),
        title: Text(
          l10n.emergencyTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          children: [
            Text(
              l10n.emergencySubtitle,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 20),
            for (int i = 0; i < steps.length; i++) ...[
              _StepCard(
                number: i + 1,
                icon: steps[i].icon,
                title: steps[i].title,
                body: steps[i].body,
                highlight: i == 3, // the "call for help" step
              ),
              const SizedBox(height: 14),
            ],
            const SizedBox(height: 10),
            Text(
              l10n.emergencyDisclaimer,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  final int number;
  final IconData icon;
  final String title;
  final String body;
  final bool highlight;

  const _StepCard({
    required this.number,
    required this.icon,
    required this.title,
    required this.body,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color accent = highlight ? const Color(0xFFC62828) : const Color(0xFF1E6097);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: highlight ? accent : Colors.black12,
          width: highlight ? 2 : 1,
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: accent,
            child: Text(
              '$number',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 22, color: accent),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  body,
                  style: const TextStyle(fontSize: 16, height: 1.35),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
