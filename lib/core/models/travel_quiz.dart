import 'travel_profile.dart';

/// Quiz question answer option
class QuizAnswer {
  final String text;
  final Map<TravelProfileType, double> scores;

  const QuizAnswer({
    required this.text,
    required this.scores,
  });
}

/// Quiz question model
class QuizQuestion {
  final String question;
  final String emoji;
  final List<QuizAnswer> answers;

  const QuizQuestion({
    required this.question,
    required this.emoji,
    required this.answers,
  });
}

/// Travel personality quiz data
class TravelQuiz {
  static const List<QuizQuestion> questions = [
    // Soru 1: Tatil stili
    QuizQuestion(
      question: 'İdeal tatilinizde hangi aktivite sizi en çok heyecanlandırır?',
      emoji: '✈️',
      answers: [
        QuizAnswer(
          text: 'Yamaç paraşütü, rafting gibi ekstrem sporlar',
          scores: {
            TravelProfileType.adventureSeeker: 3.0,
            TravelProfileType.explorer: 1.5,
            TravelProfileType.natureLover: 1.0,
          },
        ),
        QuizAnswer(
          text: 'Plajda kitap okumak ve spa keyfi',
          scores: {
            TravelProfileType.relaxedTraveler: 3.0,
            TravelProfileType.luxuryTraveler: 1.5,
          },
        ),
        QuizAnswer(
          text: 'Müzeleri ve tarihi yerleri gezmek',
          scores: {
            TravelProfileType.explorer: 3.0,
            TravelProfileType.relaxedTraveler: 1.0,
          },
        ),
        QuizAnswer(
          text: 'Gece kulüpleri ve festivaller',
          scores: {
            TravelProfileType.socialTraveler: 3.0,
            TravelProfileType.budgetBackpacker: 1.0,
          },
        ),
      ],
    ),

    // Soru 2: Konaklama tercihi
    QuizQuestion(
      question: 'Seyahatinizde nerede konaklamak istersiniz?',
      emoji: '🏨',
      answers: [
        QuizAnswer(
          text: '5 yıldızlı lüks otel veya resort',
          scores: {
            TravelProfileType.luxuryTraveler: 3.0,
            TravelProfileType.relaxedTraveler: 1.5,
          },
        ),
        QuizAnswer(
          text: 'Butik otel veya yerel pansiyon',
          scores: {
            TravelProfileType.explorer: 2.5,
            TravelProfileType.relaxedTraveler: 1.5,
          },
        ),
        QuizAnswer(
          text: 'Hostel veya paylaşımlı konaklama',
          scores: {
            TravelProfileType.budgetBackpacker: 3.0,
            TravelProfileType.socialTraveler: 2.0,
          },
        ),
        QuizAnswer(
          text: 'Çadır veya doğada kamp',
          scores: {
            TravelProfileType.natureLover: 3.0,
            TravelProfileType.adventureSeeker: 2.0,
            TravelProfileType.budgetBackpacker: 1.0,
          },
        ),
      ],
    ),

    // Soru 3: Bütçe
    QuizQuestion(
      question: 'Seyahat bütçenizi nasıl harcamayı tercih edersiniz?',
      emoji: '💰',
      answers: [
        QuizAnswer(
          text: 'En iyi deneyimler için premium ödeme',
          scores: {
            TravelProfileType.luxuryTraveler: 3.0,
            TravelProfileType.adventureSeeker: 1.0,
          },
        ),
        QuizAnswer(
          text: 'Yerel deneyimlere yatırım',
          scores: {
            TravelProfileType.explorer: 2.5,
            TravelProfileType.budgetBackpacker: 2.0,
          },
        ),
        QuizAnswer(
          text: 'Minimalist ve ekonomik',
          scores: {
            TravelProfileType.budgetBackpacker: 3.0,
            TravelProfileType.natureLover: 1.5,
          },
        ),
        QuizAnswer(
          text: 'Dengeli, konfor ve deneyim karışımı',
          scores: {
            TravelProfileType.relaxedTraveler: 2.0,
            TravelProfileType.socialTraveler: 1.5,
          },
        ),
      ],
    ),

    // Soru 4: Tempo
    QuizQuestion(
      question: 'Seyahatinizin temposu nasıl olmalı?',
      emoji: '⏱️',
      answers: [
        QuizAnswer(
          text: 'Hızlı - her gün farklı bir şehir/aktivite',
          scores: {
            TravelProfileType.explorer: 3.0,
            TravelProfileType.adventureSeeker: 2.0,
            TravelProfileType.budgetBackpacker: 1.5,
          },
        ),
        QuizAnswer(
          text: 'Yavaş - aynı yerde uzun süre kalıp derinlemesine keşif',
          scores: {
            TravelProfileType.relaxedTraveler: 3.0,
            TravelProfileType.explorer: 2.0,
          },
        ),
        QuizAnswer(
          text: 'Dengeli - planlı ama esnek',
          scores: {
            TravelProfileType.explorer: 2.0,
            TravelProfileType.socialTraveler: 1.5,
            TravelProfileType.relaxedTraveler: 1.0,
          },
        ),
        QuizAnswer(
          text: 'Spontane - plansız ve özgür',
          scores: {
            TravelProfileType.budgetBackpacker: 2.5,
            TravelProfileType.adventureSeeker: 2.0,
            TravelProfileType.natureLover: 1.5,
          },
        ),
      ],
    ),

    // Soru 5: Yemek deneyimi
    QuizQuestion(
      question: 'Seyahatinizde yemek deneyimi sizin için ne ifade eder?',
      emoji: '🍽️',
      answers: [
        QuizAnswer(
          text: 'Michelin yıldızlı restoranlar ve fine dining',
          scores: {
            TravelProfileType.luxuryTraveler: 3.0,
            TravelProfileType.relaxedTraveler: 1.0,
          },
        ),
        QuizAnswer(
          text: 'Sokak lezzetleri ve yerel pazarlar',
          scores: {
            TravelProfileType.budgetBackpacker: 3.0,
            TravelProfileType.explorer: 2.5,
            TravelProfileType.socialTraveler: 1.5,
          },
        ),
        QuizAnswer(
          text: 'Geleneksel yerel mutfak ve otantik deneyimler',
          scores: {
            TravelProfileType.explorer: 3.0,
            TravelProfileType.budgetBackpacker: 1.5,
          },
        ),
        QuizAnswer(
          text: 'Rahat ve tanıdık tatlar',
          scores: {
            TravelProfileType.relaxedTraveler: 2.5,
            TravelProfileType.socialTraveler: 1.0,
          },
        ),
      ],
    ),

    // Soru 6: Doğa vs Şehir
    QuizQuestion(
      question: 'Hangi ortamda daha mutlu olursunuz?',
      emoji: '🌍',
      answers: [
        QuizAnswer(
          text: 'Dağlar, ormanlar ve vahşi doğa',
          scores: {
            TravelProfileType.natureLover: 3.0,
            TravelProfileType.adventureSeeker: 2.0,
          },
        ),
        QuizAnswer(
          text: 'Modern şehirler ve metropoller',
          scores: {
            TravelProfileType.socialTraveler: 2.5,
            TravelProfileType.luxuryTraveler: 2.0,
            TravelProfileType.explorer: 1.5,
          },
        ),
        QuizAnswer(
          text: 'Küçük kasabalar ve köyler',
          scores: {
            TravelProfileType.relaxedTraveler: 2.5,
            TravelProfileType.explorer: 2.0,
          },
        ),
        QuizAnswer(
          text: 'Tropik adalar ve plajlar',
          scores: {
            TravelProfileType.relaxedTraveler: 3.0,
            TravelProfileType.luxuryTraveler: 1.5,
          },
        ),
      ],
    ),

    // Soru 7: Seyahat arkadaşı
    QuizQuestion(
      question: 'Kimlerle seyahat etmeyi tercih edersiniz?',
      emoji: '👥',
      answers: [
        QuizAnswer(
          text: 'Yalnız - kendi başıma keşfetmek isterim',
          scores: {
            TravelProfileType.explorer: 2.5,
            TravelProfileType.budgetBackpacker: 2.0,
            TravelProfileType.natureLover: 1.5,
          },
        ),
        QuizAnswer(
          text: 'Partnerimle romantik bir kaçamak',
          scores: {
            TravelProfileType.relaxedTraveler: 2.5,
            TravelProfileType.luxuryTraveler: 2.0,
          },
        ),
        QuizAnswer(
          text: 'Arkadaş grubuyla eğlence dolu',
          scores: {
            TravelProfileType.socialTraveler: 3.0,
            TravelProfileType.adventureSeeker: 1.5,
          },
        ),
        QuizAnswer(
          text: 'Yeni insanlarla tanışıp grup oluşturmak',
          scores: {
            TravelProfileType.socialTraveler: 2.5,
            TravelProfileType.budgetBackpacker: 2.0,
            TravelProfileType.explorer: 1.0,
          },
        ),
      ],
    ),

    // Soru 8: Aktivite seviyesi
    QuizQuestion(
      question: 'Fiziksel aktivite seviyeniz nasıl olmalı?',
      emoji: '💪',
      answers: [
        QuizAnswer(
          text: 'Yoğun - trekking, dağcılık, dalış',
          scores: {
            TravelProfileType.adventureSeeker: 3.0,
            TravelProfileType.natureLover: 2.5,
          },
        ),
        QuizAnswer(
          text: 'Orta - yürüyüş ve bisiklet turları',
          scores: {
            TravelProfileType.explorer: 2.5,
            TravelProfileType.natureLover: 2.0,
            TravelProfileType.socialTraveler: 1.0,
          },
        ),
        QuizAnswer(
          text: 'Hafif - şehir gezileri ve kısa yürüyüşler',
          scores: {
            TravelProfileType.socialTraveler: 2.5,
            TravelProfileType.relaxedTraveler: 2.0,
          },
        ),
        QuizAnswer(
          text: 'Minimum - dinlenme ve rahatlama odaklı',
          scores: {
            TravelProfileType.relaxedTraveler: 3.0,
            TravelProfileType.luxuryTraveler: 2.0,
          },
        ),
      ],
    ),

    // Soru 9: Planlama stili
    QuizQuestion(
      question: 'Seyahat planlamasına yaklaşımınız nasıl?',
      emoji: '📋',
      answers: [
        QuizAnswer(
          text: 'Her şey detaylı planlanmış olmalı',
          scores: {
            TravelProfileType.luxuryTraveler: 2.5,
            TravelProfileType.relaxedTraveler: 2.0,
          },
        ),
        QuizAnswer(
          text: 'Genel bir çerçeve, detaylar spontane',
          scores: {
            TravelProfileType.explorer: 2.5,
            TravelProfileType.relaxedTraveler: 2.0,
          },
        ),
        QuizAnswer(
          text: 'Tamamen spontane ve plansız',
          scores: {
            TravelProfileType.budgetBackpacker: 3.0,
            TravelProfileType.adventureSeeker: 2.0,
          },
        ),
        QuizAnswer(
          text: 'Tur operatörüne bırakırım',
          scores: {
            TravelProfileType.luxuryTraveler: 2.0,
            TravelProfileType.relaxedTraveler: 1.5,
          },
        ),
      ],
    ),

    // Soru 10: Unutulmaz anı
    QuizQuestion(
      question: 'Seyahatten döndüğünüzde en çok neyi hatırlamak istersiniz?',
      emoji: '✨',
      answers: [
        QuizAnswer(
          text: 'Adrenalin dolu maceralar ve sınırları aşmak',
          scores: {
            TravelProfileType.adventureSeeker: 3.0,
            TravelProfileType.explorer: 1.5,
          },
        ),
        QuizAnswer(
          text: 'Derin rahatlama ve huzur anları',
          scores: {
            TravelProfileType.relaxedTraveler: 3.0,
            TravelProfileType.luxuryTraveler: 1.5,
          },
        ),
        QuizAnswer(
          text: 'Yerel insanlarla etkileşim ve kültürel deneyimler',
          scores: {
            TravelProfileType.socialTraveler: 3.0,
            TravelProfileType.explorer: 2.0,
          },
        ),
        QuizAnswer(
          text: 'Keşfettiğim gizli yerler ve benzersiz deneyimler',
          scores: {
            TravelProfileType.explorer: 3.0,
            TravelProfileType.natureLover: 1.5,
          },
        ),
      ],
    ),
  ];

  /// Calculate travel profile from quiz answers
  static TravelProfile calculateProfile(List<int> answerIndices) {
    final Map<TravelProfileType, double> totalScores = {};

    // Initialize scores
    for (final type in TravelProfileType.values) {
      totalScores[type] = 0;
    }

    // Calculate scores from answers
    for (int i = 0; i < answerIndices.length && i < questions.length; i++) {
      final selectedAnswer = questions[i].answers[answerIndices[i]];
      selectedAnswer.scores.forEach((type, score) {
        totalScores[type] = (totalScores[type] ?? 0) + score;
      });
    }

    // Find the dominant profile type
    TravelProfileType dominantType = TravelProfileType.explorer;
    double maxScore = 0;

    totalScores.forEach((type, score) {
      if (score > maxScore) {
        maxScore = score;
        dominantType = type;
      }
    });

    return TravelProfile(
      type: dominantType,
      scores: totalScores,
      completedAt: DateTime.now(),
    );
  }
}

