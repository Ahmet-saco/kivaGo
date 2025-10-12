import 'package:flutter/material.dart';

/// Settings page
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Ayarlar',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Account Section
              const Text(
                'Hesap',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              _buildSettingsItem(
                icon: Icons.person_outline,
                title: 'Hesap Detayları',
                subtitle: 'Hesap bilgilerinizi yönetin',
                onTap: () {},
              ),

              const SizedBox(height: 12),

              _buildSettingsItem(
                icon: Icons.lock_outline,
                title: 'Şifre Değiştir',
                subtitle: 'Şifrenizi değiştirin',
                onTap: () {},
              ),

              const SizedBox(height: 32),

              // Preferences Section
              const Text(
                'Tercihler',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              _buildSettingsItem(
                icon: Icons.settings_outlined,
                title: 'Uygulama Tercihleri',
                subtitle: 'Deneyiminizi özelleştirin',
                onTap: () {},
              ),

              const SizedBox(height: 12),

              _buildSettingsItem(
                icon: Icons.notifications_outlined,
                title: 'Bildirimler',
                subtitle: 'Bildirimlerinizi yönetin',
                onTap: () {},
              ),

              const SizedBox(height: 32),

              // Support Section
              const Text(
                'Destek',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              _buildSettingsItem(
                icon: Icons.help_outline,
                title: 'Yardım Merkezi',
                subtitle: 'Yardım ve destek alın',
                onTap: () {},
              ),

              const SizedBox(height: 12),

              _buildSettingsItem(
                icon: Icons.email_outlined,
                title: 'Bize Ulaşın',
                subtitle: 'Yardım için bize ulaşın',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFCF3F6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.black, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
