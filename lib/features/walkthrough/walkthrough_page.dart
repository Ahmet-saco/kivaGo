import 'package:flutter/material.dart';
import '../auth/signup_page.dart';

/// Walkthrough introduction page with onboarding flow
class WalkthroughPage extends StatefulWidget {
  const WalkthroughPage({super.key});

  @override
  State<WalkthroughPage> createState() => _WalkthroughPageState();
}

class _WalkthroughPageState extends State<WalkthroughPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<WalkthroughItem> _pages = [
    WalkthroughItem(
      title: "Rotaları unut, hisleri keşfet.",
      description: "Geleneksel seyahat uygulamalarının aksine, biz sana 'nereye gitmeliyim?' değil, 'nasıl hissetmek istiyorum?' sorularını soruyoruz.",
      emoji: "🧭",
      color: const Color(0xFFFCE4E0),
    ),
    WalkthroughItem(
      title: "İçindeki 'Arayıcı'yı ortaya çıkar.",
      description: "Ruh halini, kişilik özelliklerini ve içsel arayışlarını analiz ederek sana en uygun, kişiselleştirilmiş seyahat deneyimleri sunuyoruz.",
      emoji: "🌟",
      color: const Color(0xFFF3E6D2),
    ),
    WalkthroughItem(
      title: "Senin gibi hissedenlerle yola çık.",
      description: "Benzer ruh halindeki gezginlerle tanış, ortak deneyimler yaşa ve unutulmaz anılar biriktir.",
      emoji: "👥",
      color: const Color(0xFFFAE8DC),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToAuth();
    }
  }

  void _goToAuth() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _pages[_currentPage].color,
              _pages[_currentPage].color.withOpacity(0.8),
              const Color(0xFFF3E6D2),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Skip button
              Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: _goToAuth,
                    child: Text(
                      'Geç',
                      style: TextStyle(
                        color: const Color(0xFF666666),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              // Page content
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return _buildPage(_pages[index]);
                  },
                ),
              ),

              // Bottom section
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Page indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _pages.length,
                        (index) => Container(
                          width: _currentPage == index ? 24 : 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? const Color(0xFFC11336)
                                : const Color(0xFFC11336).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Action button
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC11336),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          _currentPage == _pages.length - 1 ? 'Başlayalım' : 'Devam Et',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(WalkthroughItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Emoji
          Container(
            width: 160,
            height: 160,
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
            child: Center(
              child: Text(
                item.emoji,
                style: const TextStyle(fontSize: 80),
              ),
            ),
          ),

          const SizedBox(height: 60),

          // Title
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C2C2C),
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Description
          Text(
            item.description,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF666666),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class WalkthroughItem {
  final String title;
  final String description;
  final String emoji;
  final Color color;

  WalkthroughItem({
    required this.title,
    required this.description,
    required this.emoji,
    required this.color,
  });
}
