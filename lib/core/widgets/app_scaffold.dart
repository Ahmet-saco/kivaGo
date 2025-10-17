import 'package:flutter/material.dart';
import '../../features/chat/chat_page.dart';
import '../../features/travels/travels_page.dart';
import '../../features/profile/profile_page.dart';
import '../../features/settings/settings_page.dart';

/// Main app scaffold with bottom navigation
class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

// Global key to access AppScaffold state
final GlobalKey<_AppScaffoldState> appScaffoldKey = GlobalKey<_AppScaffoldState>();

class _AppScaffoldState extends State<AppScaffold> {
  int _currentIndex = 0;

  // Keep all pages in memory to preserve scroll state
  final List<Widget> _pages = const [
    ChatPage(),
    TravelsPage(),
    ProfilePage(),
    SettingsPage(),
  ];

  // Method to switch to chat page
  void switchToChatPage() {
    setState(() {
      _currentIndex = 0; // ChatPage is at index 0
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 28),
            activeIcon: Icon(Icons.home, size: 28),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight_takeoff_outlined, size: 28),
            activeIcon: Icon(Icons.flight_takeoff, size: 28),
            label: 'Seyahatler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 28),
            activeIcon: Icon(Icons.person, size: 28),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined, size: 28),
            activeIcon: Icon(Icons.settings, size: 28),
            label: 'Ayarlar',
          ),
        ],
      ),
    );
  }
}
