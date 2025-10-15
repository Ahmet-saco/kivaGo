import 'package:flutter/material.dart';
import '../../core/models/travel_quiz.dart';
import '../../core/models/travel_profile.dart';
import '../../core/models/user_model.dart';
import '../../core/services/auth_service.dart';
import 'quiz_result_page.dart';

/// Travel personality quiz page
class TravelQuizPage extends StatefulWidget {
  const TravelQuizPage({super.key});

  @override
  State<TravelQuizPage> createState() => _TravelQuizPageState();
}

class _TravelQuizPageState extends State<TravelQuizPage> {
  final PageController _pageController = PageController();
  final List<int> _answers = [];
  int _currentQuestion = 0;
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectAnswer(int answerIndex) {
    setState(() {
      if (_currentQuestion < _answers.length) {
        _answers[_currentQuestion] = answerIndex;
      } else {
        _answers.add(answerIndex);
      }
    });

    // Wait a bit for animation, then move to next question
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_currentQuestion < TravelQuiz.questions.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
        setState(() => _currentQuestion++);
      } else {
        _showResults();
      }
    });
  }

  Future<void> _showResults() async {
    setState(() => _isLoading = true);
    
    try {
      final profile = TravelQuiz.calculateProfile(_answers);
      
      // Save quiz results to Firestore
      await _saveQuizResults(_answers, profile);
      
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => QuizResultPage(profile: profile),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Quiz sonuçları kaydedilirken hata oluştu: $e'),
            backgroundColor: const Color(0xFFC11336),
          ),
        );
        // Still show results even if saving fails
        final profile = TravelQuiz.calculateProfile(_answers);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => QuizResultPage(profile: profile),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _saveQuizResults(List<int> answers, TravelProfile profile) async {
    try {
      // Get current user from Firestore
      final user = await _authService.getCurrentUserFromFirestore();
      if (user == null) throw Exception('Kullanıcı bulunamadı');

      // Create new seeker profile with quiz results
      final newSeekerProfile = SeekerProfileModel(
        title: profile.type.title,
        description: profile.type.description,
        testAnswers: answers,
        calculatedScores: CalculatedScoresModel(
          adventure: profile.scores[TravelProfileType.adventureSeeker] ?? 0.0,
          serenity: profile.scores[TravelProfileType.relaxedTraveler] ?? 0.0,
          culture: profile.scores[TravelProfileType.explorer] ?? 0.0,
          social: profile.scores[TravelProfileType.socialTraveler] ?? 0.0,
        ),
      );

      // Update user's seeker profile in Firestore
      await _authService.updateSeekerProfile(newSeekerProfile);
    } catch (e) {
      print('Error saving quiz results: $e');
      rethrow;
    }
  }

  void _previousQuestion() {
    if (_currentQuestion > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() => _currentQuestion--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_currentQuestion + 1) / TravelQuiz.questions.length;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFFCE4E0).withOpacity(0.3),
              const Color(0xFFF3E6D2).withOpacity(0.3),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: _currentQuestion == 0
                              ? () => Navigator.pop(context)
                              : _previousQuestion,
                        ),
                        const Spacer(),
                        Text(
                          '${_currentQuestion + 1} / ${TravelQuiz.questions.length}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF666666),
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(width: 48),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Progress bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: const Color(0xFFE0E0E0),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFFC11336),
                        ),
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              ),

              // Questions or Loading
              Expanded(
                child: _isLoading
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFFC11336),
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Sonuçlar hesaplanıyor...',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ],
                        ),
                      )
                    : PageView.builder(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: TravelQuiz.questions.length,
                        itemBuilder: (context, index) {
                          final question = TravelQuiz.questions[index];
                          return _buildQuestionPage(question, index);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionPage(QuizQuestion question, int questionIndex) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Emoji
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFC11336).withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  question.emoji,
                  style: const TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Question
          Text(
            question.question,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C2C2C),
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 40),

          // Answer options
          ...question.answers.asMap().entries.map((entry) {
            final index = entry.key;
            final answer = entry.value;
            final isSelected = _answers.length > questionIndex &&
                _answers[questionIndex] == index;

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildAnswerOption(
                answer.text,
                index,
                isSelected,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildAnswerOption(String text, int index, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _selectAnswer(index),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFFC11336)
                  : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFFC11336)
                    : const Color(0xFFE0E0E0),
                width: 2,
              ),
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                    color: const Color(0xFFC11336).withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFFE0E0E0),
                      width: 2,
                    ),
                    color: isSelected
                        ? Colors.white
                        : Colors.transparent,
                  ),
                  child: isSelected
                      ? const Center(
                          child: Icon(
                            Icons.check,
                            size: 16,
                            color: Color(0xFFC11336),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF2C2C2C),
                      height: 1.4,
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

