import '../../core/services/auth_service.dart';
import '../../core/models/user_model.dart';

/// Service to check if user has completed travel personality quiz
class QuizCheckService {
  final AuthService _authService;
  
  QuizCheckService(this._authService);

  /// Check if current user has completed the quiz
  Future<bool> hasUserCompletedQuiz() async {
    try {
      final user = await _authService.getCurrentUserFromFirestore();
      if (user == null) return false;
      
      // Check if user has quiz answers and calculated scores
      final hasAnswers = user.seekerProfile.testAnswers.isNotEmpty;
      final hasScores = _hasValidScores(user.seekerProfile.calculatedScores);
      
      return hasAnswers && hasScores;
    } catch (e) {
      print('Error checking quiz completion: $e');
      return false;
    }
  }

  /// Check if calculated scores are valid (not all zeros)
  bool _hasValidScores(CalculatedScoresModel scores) {
    return scores.adventure > 0 || 
           scores.serenity > 0 || 
           scores.culture > 0 || 
           scores.social > 0;
  }

  /// Get user's travel personality title
  Future<String> getUserTravelPersonalityTitle() async {
    try {
      final user = await _authService.getCurrentUserFromFirestore();
      if (user == null) return 'Yeni Gezgin';
      
      // Return the title from seeker profile
      return user.seekerProfile.title;
    } catch (e) {
      print('Error getting travel personality title: $e');
      return 'Yeni Gezgin';
    }
  }

  /// Get user's travel personality description
  Future<String> getUserTravelPersonalityDescription() async {
    try {
      final user = await _authService.getCurrentUserFromFirestore();
      if (user == null) return 'Seyahat kişiliğini keşfetmeye hazır!';
      
      // Return the description from seeker profile
      return user.seekerProfile.description;
    } catch (e) {
      print('Error getting travel personality description: $e');
      return 'Seyahat kişiliğini keşfetmeye hazır!';
    }
  }
}
