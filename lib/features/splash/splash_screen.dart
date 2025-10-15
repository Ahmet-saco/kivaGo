import 'package:flutter/material.dart';
import 'dart:async';
import '../../core/services/auth_service.dart';
import '../../core/widgets/app_scaffold.dart';
import '../walkthrough/walkthrough_page.dart';

/// Splash screen with kivaGo branding
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  final _authService = AuthService();

  @override
  void initState() {
    super.initState();

    // Animation setup
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _animationController.forward();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    // Wait for animation and auth check
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    try {
      final user = _authService.currentUser;

      if (user != null) {
        // User is logged in, go to main app
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AppScaffold()),
        );
      } else {
        // User is not logged in, go to walkthrough
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WalkthroughPage()),
        );
      }
    } catch (e) {
      // On error, go to walkthrough
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WalkthroughPage()),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFCE4E0), // Light pink
              Color(0xFFF3E6D2), // Cream
              Color(0xFFFAE8DC), // Light peach
            ],
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo - Plane Icon
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFC11336).withOpacity(0.2),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.flight_takeoff,
                      size: 60,
                      color: Color(0xFFC11336),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // App Name
                const Text(
                  'kivaGo AI',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                    letterSpacing: -1,
                  ),
                ),

                const SizedBox(height: 16),

                // Tagline
                const Text(
                  'Nasıl hissetmek istersin?',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFF2C2C2C),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),

                const SizedBox(height: 8),

                // Subtitle
                const Text(
                  'Senin tarzın, Senin seyahatin',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF666666),
                    letterSpacing: 0.5,
                  ),
                ),

                const SizedBox(height: 60),

                // Loading indicator
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFFC11336),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
