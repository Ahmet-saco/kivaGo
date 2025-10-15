import 'package:flutter/material.dart';
import '../../core/services/auth_service.dart';
import '../../core/services/firestore_service.dart';
import '../../core/models/user_model.dart';
import '../../core/models/travel_plan_model.dart';
import '../../core/models/match_model.dart';

class FirestoreTestPage extends StatefulWidget {
  const FirestoreTestPage({super.key});

  @override
  State<FirestoreTestPage> createState() => _FirestoreTestPageState();
}

class _FirestoreTestPageState extends State<FirestoreTestPage> {
  final AuthService _authService = AuthService();
  String _status = 'Hazır';
  final List<String> _logs = [];

  void _addLog(String message) {
    setState(() {
      _logs.add('${DateTime.now().toString().substring(11, 19)}: $message');
    });
  }

  Future<void> _testAllCollections() async {
    setState(() {
      _status = 'Tüm koleksiyonlar test ediliyor...';
      _logs.clear();
    });

    try {
      _addLog('🔄 Firebase Auth durumu kontrol ediliyor...');
      final user = _authService.currentUser;

      if (user == null) {
        _addLog('❌ Kullanıcı giriş yapmamış');
        setState(() => _status = 'Hata: Kullanıcı giriş yapmamış');
        return;
      }

      _addLog('✅ Kullanıcı giriş yapmış: ${user.email}');

      // Test Users Collection
      await _testUsersCollection(user);

      // Test Travel Plans Collection
      await _testTravelPlansCollection(user.uid);

      // Test Matches Collection
      await _testMatchesCollection(user.uid);

      setState(() => _status = 'Başarılı: Tüm koleksiyonlar test edildi');
    } catch (e) {
      _addLog('❌ Hata: $e');
      setState(() => _status = 'Hata: $e');
    }
  }

  Future<void> _testUsersCollection(dynamic firebaseUser) async {
    _addLog('🔄 Users koleksiyonu test ediliyor...');

    final firestoreUser = await _authService.getCurrentUserFromFirestore();

    if (firestoreUser != null) {
      _addLog('✅ Users: Kullanıcı verisi bulundu');
      _addLog(
          '📝 Users: ${firestoreUser.displayName} - ${firestoreUser.email}');
    } else {
      _addLog('❌ Users: Kullanıcı verisi bulunamadı');
      _addLog('🔄 Users: Yeni kullanıcı oluşturuluyor...');

      final newUser = UserModel(
        uid: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        displayName: firebaseUser.displayName ?? 'Test User',
        photoUrl: firebaseUser.photoURL ?? '',
        createdAt: DateTime.now(),
        fcmToken: '',
        seekerProfile: SeekerProfileModel(
          title: 'Test Gezgin',
          description: 'Test kullanıcısı',
          testAnswers: [1, 2, 3, 4, 5],
          calculatedScores: CalculatedScoresModel(
            adventure: 0.7,
            serenity: 0.3,
            culture: 0.5,
            social: 0.8,
          ),
        ),
      );

      await FirestoreService.createUser(newUser);
      _addLog('✅ Users: Kullanıcı oluşturuldu');
    }
  }

  Future<void> _testTravelPlansCollection(String userId) async {
    _addLog('🔄 TravelPlans koleksiyonu test ediliyor...');

    try {
      // Create a test travel plan
      final testTravelPlan = TravelPlanModel(
        planId: 'test_plan_${DateTime.now().millisecondsSinceEpoch}',
        ownerId: userId,
        title: 'Test Seyahat Planı',
        status: 'active',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        experienceManifesto:
            'Bu bir test seyahat planıdır. Kullanıcının maceracı ruhunu keşfetmek için tasarlandı.',
        moodKeywords: ['macera', 'keşif', 'doğa', 'huzur'],
        suggestedRoute: [
          SuggestedRouteItemModel(
            locationName: 'Kapadokya, Türkiye',
            durationDays: 3,
            reasoning:
                'Maceraperest ruhuna uygun balon turları ve doğa yürüyüşleri',
            activities: ['Sıcak hava balonu', 'ATV turu', 'Yeraltı şehirleri'],
          ),
          SuggestedRouteItemModel(
            locationName: 'Antalya, Türkiye',
            durationDays: 2,
            reasoning: 'Dinlenme ve deniz keyfi için ideal',
            activities: ['Plaj', 'Müze ziyareti', 'Yelken'],
          ),
        ],
        aiConversationHistory: [
          AiConversationItemModel(
            role: 'user',
            content: 'Macera dolu bir seyahat istiyorum',
          ),
          AiConversationItemModel(
            role: 'assistant',
            content:
                'Size Kapadokya ve Antalya rotası öneriyorum. Macera ve dinlenme dengesi mükemmel olacak!',
          ),
        ],
      );

      await FirestoreService.createTravelPlan(testTravelPlan);
      _addLog('✅ TravelPlans: Test seyahat planı oluşturuldu');
      _addLog(
          '📝 TravelPlans: ${testTravelPlan.title} - ${testTravelPlan.suggestedRoute.length} lokasyon');
    } catch (e) {
      _addLog('❌ TravelPlans: Hata - $e');
    }
  }

  Future<void> _testMatchesCollection(String userId) async {
    _addLog('🔄 Matches koleksiyonu test ediliyor...');

    try {
      // Create a test match
      final testMatch = MatchModel(
        matchId: 'test_match_${DateTime.now().millisecondsSinceEpoch}',
        status: 'pending',
        relatedTravelPlanId:
            'test_plan_${DateTime.now().millisecondsSinceEpoch}',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        users: [userId, 'other_user_id'],
        initiatorId: userId,
      );

      await FirestoreService.createMatch(testMatch);
      _addLog('✅ Matches: Test eşleşme oluşturuldu');
      _addLog(
          '📝 Matches: ${testMatch.matchId} - ${testMatch.users.length} kullanıcı');
    } catch (e) {
      _addLog('❌ Matches: Hata - $e');
    }
  }

  Future<void> _testFirestoreConnection() async {
    setState(() {
      _status = 'Test ediliyor...';
      _logs.clear();
    });

    try {
      _addLog('🔄 Firebase Auth durumu kontrol ediliyor...');
      final user = _authService.currentUser;

      if (user == null) {
        _addLog('❌ Kullanıcı giriş yapmamış');
        setState(() => _status = 'Hata: Kullanıcı giriş yapmamış');
        return;
      }

      _addLog('✅ Kullanıcı giriş yapmış: ${user.email}');
      _addLog('🔄 Firestore\'dan kullanıcı verisi okunuyor...');

      final firestoreUser = await _authService.getCurrentUserFromFirestore();

      if (firestoreUser != null) {
        _addLog('✅ Firestore\'dan kullanıcı verisi başarıyla okundu');
        _addLog('📝 Kullanıcı adı: ${firestoreUser.displayName}');
        _addLog('📝 Email: ${firestoreUser.email}');
        _addLog('📝 UID: ${firestoreUser.uid}');
        _addLog('📝 Oluşturulma tarihi: ${firestoreUser.createdAt}');
        setState(() => _status = 'Başarılı: Veri bulundu');
      } else {
        _addLog('❌ Firestore\'da kullanıcı verisi bulunamadı');
        _addLog('🔄 Yeni kullanıcı oluşturuluyor...');

        // Manuel olarak kullanıcı oluştur
        final newUser = UserModel(
          uid: user.uid,
          email: user.email ?? '',
          displayName: user.displayName ?? 'Test User',
          photoUrl: user.photoURL ?? '',
          createdAt: DateTime.now(),
          fcmToken: '',
          seekerProfile: SeekerProfileModel(
            title: 'Test Gezgin',
            description: 'Manuel test kullanıcısı',
            testAnswers: [],
            calculatedScores: CalculatedScoresModel(
              adventure: 0.0,
              serenity: 0.0,
              culture: 0.0,
              social: 0.0,
            ),
          ),
        );

        await FirestoreService.createUser(newUser);
        _addLog('✅ Manuel kullanıcı oluşturuldu');

        // Tekrar oku
        final createdUser = await _authService.getCurrentUserFromFirestore();
        if (createdUser != null) {
          _addLog('✅ Oluşturulan kullanıcı doğrulandı');
          setState(
              () => _status = 'Başarılı: Kullanıcı oluşturuldu ve doğrulandı');
        } else {
          _addLog('❌ Oluşturulan kullanıcı doğrulanamadı');
          setState(() => _status = 'Hata: Doğrulama başarısız');
        }
      }
    } catch (e) {
      _addLog('❌ Hata: $e');
      setState(() => _status = 'Hata: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Test (Users)'),
        backgroundColor: const Color(0xFFC11336),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _status.contains('Hata')
                    ? Colors.red.withOpacity(0.1)
                    : _status.contains('Başarılı')
                        ? Colors.green.withOpacity(0.1)
                        : Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _status.contains('Hata')
                      ? Colors.red
                      : _status.contains('Başarılı')
                          ? Colors.green
                          : Colors.blue,
                ),
              ),
              child: Text(
                'Durum: $_status',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Test Button (Sadece Users aktif)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _testFirestoreConnection,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC11336),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Firestore Bağlantısını Test Et',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Info Card - TravelPlans & Matches pasif
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.orange.withOpacity(0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.orange[700],
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Geliştirme Notu',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'TravelPlans ve Matches koleksiyonları şu anda pasif durumda. Chat/AI entegrasyonu ve kullanıcı eşleşme sistemi aktif edildiğinde kullanılacak.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.orange[600],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Logs
            const Text(
              'Test Logları:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                ),
                child: _logs.isEmpty
                    ? const Center(
                        child: Text(
                          'Henüz test yapılmadı',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _logs.length,
                        itemBuilder: (context, index) {
                          final log = _logs[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              log,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'monospace',
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
