import 'package:flutter/material.dart';

/// Seyahat Düzenleme ve Detaylandırma Sayfası
class TravelEditPage extends StatefulWidget {
  final Map<String, dynamic> travel;

  const TravelEditPage({super.key, required this.travel});

  @override
  State<TravelEditPage> createState() => _TravelEditPageState();
}

class _TravelEditPageState extends State<TravelEditPage> {
  final TextEditingController _notesController = TextEditingController();

  // Mock data - Günlük plan
  final List<Map<String, dynamic>> _dailyPlan = [
    {
      'day': 1,
      'date': '15 Kasım',
      'activities': ['Havaalanına varış', 'Otel check-in', 'Eiffel Kulesi'],
    },
    {
      'day': 2,
      'date': '16 Kasım',
      'activities': ['Louvre Müzesi', 'Notre Dame', 'Seine Nehri Turu'],
    },
  ];

  // Mock data - Checklist
  final List<Map<String, dynamic>> _checklist = [
    {'item': 'Pasaport', 'checked': true},
    {'item': 'Uçak bileti', 'checked': true},
    {'item': 'Otel rezervasyonu', 'checked': true},
    {'item': 'Bavul hazırlığı', 'checked': false},
    {'item': 'Kamera', 'checked': false},
  ];

  int _expandedDay = -1;

  @override
  void initState() {
    super.initState();
    _notesController.text =
        'Paris\'te mutlaka Sacré-Cœur Bazilikası\'nı ziyaret et!\nMontmartre bölgesi çok güzel.';
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Aktif':
        return const Color(0xFF4CAF50);
      case 'Tamamlanan':
        return const Color(0xFFC11336);
      case 'İptal':
        return const Color(0xFF999999);
      default:
        return const Color(0xFFCD5970);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Seyahati Düzenle',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeader(),

            const SizedBox(height: 24),

            // Quick Info Cards
            _buildQuickInfo(),

            const SizedBox(height: 24),

            // Daily Plan Section
            _buildSection(
              title: 'Günlük Plan',
              icon: Icons.calendar_month_outlined,
              child: _buildDailyPlan(),
            ),

            const SizedBox(height: 24),

            // Notes Section
            _buildSection(
              title: 'Notlarım',
              icon: Icons.note_outlined,
              child: _buildNotes(),
            ),

            const SizedBox(height: 24),

            // Checklist Section
            _buildSection(
              title: 'Yapılacaklar',
              icon: Icons.checklist_outlined,
              child: _buildChecklist(),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.travel['destination'],
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _getStatusColor(widget.travel['status']),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.travel['status'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 16,
                color: Color(0xFF666666),
              ),
              const SizedBox(width: 6),
              Text(
                widget.travel['date'],
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF666666),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: _buildInfoCard(
              icon: Icons.access_time,
              label: 'Süre',
              value: widget.travel['days'],
              color: const Color(0xFFFCF3F6),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildInfoCard(
              icon: Icons.local_activity_outlined,
              label: 'Aktivite',
              value: '${widget.travel['activities']}',
              color: const Color(0xFFFDF5F7),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildInfoCard(
              icon: Icons.monetization_on_outlined,
              label: 'Bütçe',
              value: widget.travel['budget'],
              color: const Color(0xFFFCF3F6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 24, color: const Color(0xFFC11336)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 22, color: const Color(0xFFC11336)),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildDailyPlan() {
    return Column(
      children: _dailyPlan.asMap().entries.map((entry) {
        final index = entry.key;
        final day = entry.value;
        final isExpanded = _expandedDay == index;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _expandedDay = isExpanded ? -1 : index;
                  });
                },
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFC11336),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            '${day['day']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gün ${day['day']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              day['date'],
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF999999),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: const Color(0xFF666666),
                      ),
                    ],
                  ),
                ),
              ),
              if (isExpanded)
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    children: (day['activities'] as List<String>)
                        .map(
                          (activity) => Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 6),
                                  width: 6,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFCD5970),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    activity,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNotes() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFCF3F6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
      ),
      child: TextField(
        controller: _notesController,
        maxLines: 6,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black87,
          height: 1.5,
        ),
        decoration: const InputDecoration(
          hintText: 'Notlarınızı buraya yazın...',
          hintStyle: TextStyle(color: Color(0xFF999999)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget _buildChecklist() {
    return Column(
      children: _checklist.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
          ),
          child: CheckboxListTile(
            value: item['checked'],
            onChanged: (value) {
              setState(() {
                item['checked'] = value ?? false;
              });
            },
            title: Text(
              item['item'],
              style: TextStyle(
                fontSize: 15,
                color: item['checked']
                    ? const Color(0xFF999999)
                    : Colors.black87,
                decoration: item['checked']
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            activeColor: const Color(0xFFC11336),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFC11336),
                  side: const BorderSide(color: Color(0xFFC11336), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'İptal',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Değişiklikler kaydedildi!'),
                      backgroundColor: Color(0xFF4CAF50),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC11336),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                icon: const Icon(Icons.check, size: 20),
                label: const Text(
                  'Kaydet',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
