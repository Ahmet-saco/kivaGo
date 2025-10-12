import 'dart:ui';
import 'package:flutter/material.dart';
import 'travel_edit_page.dart';

/// Seyahatlerim (My Travels) page - Shows user's confirmed travel plans
class TravelsPage extends StatefulWidget {
  const TravelsPage({super.key});

  @override
  State<TravelsPage> createState() => _TravelsPageState();
}

class _TravelsPageState extends State<TravelsPage> {
  String _selectedFilter = 'Tümü';
  final List<String> _filters = ['Tümü', 'Aktif', 'Tamamlanan', 'İptal'];

  // Temsili seyahat verileri (mock data)
  final List<Map<String, dynamic>> _travels = [
    {
      'id': '1',
      'destination': 'Paris, Fransa',
      'date': '15-20 Kasım 2025',
      'status': 'Aktif',
      'image':
          'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800',
      'days': '6 Gün',
      'activities': 12,
      'budget': '₺25,000',
      'color': Color(0xFFC11336),
    },
    {
      'id': '2',
      'destination': 'Tokyo, Japonya',
      'date': '5-15 Aralık 2025',
      'status': 'Aktif',
      'image':
          'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800',
      'days': '10 Gün',
      'activities': 20,
      'budget': '₺45,000',
      'color': Color(0xFFCD5970),
    },
    {
      'id': '3',
      'destination': 'İstanbul, Türkiye',
      'date': '1-5 Ekim 2025',
      'status': 'Tamamlanan',
      'image':
          'https://images.unsplash.com/photo-1527838832700-5059252407fa?w=800',
      'days': '5 Gün',
      'activities': 8,
      'budget': '₺8,000',
      'color': Color(0xFFF56F29),
    },
    {
      'id': '4',
      'destination': 'Roma, İtalya',
      'date': '10-17 Eylül 2025',
      'status': 'Tamamlanan',
      'image':
          'https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=800',
      'days': '7 Gün',
      'activities': 15,
      'budget': '₺20,000',
      'color': Color(0xFFDEB89A),
    },
  ];

  List<Map<String, dynamic>> get _filteredTravels {
    if (_selectedFilter == 'Tümü') return _travels;
    return _travels
        .where((travel) => travel['status'] == _selectedFilter)
        .toList();
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Aktif':
        return const Color(0xFF4CAF50); // Yeşil - Aktif seyahat
      case 'Tamamlanan':
        return const Color(0xFFC11336); // Kırmızı - Tamamlanmış seyahat
      case 'İptal':
        return const Color(0xFF999999); // Gri - İptal edilmiş
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
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Seyahatlerim',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.black,
                size: 28,
              ),
              onPressed: () {
                // Yeni seyahat oluşturma sayfasına git
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Yeni seyahat planı oluşturuluyor...'),
                    backgroundColor: Color(0xFFC11336),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // Filter Chips
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                final filter = _filters[index];
                final isSelected = _selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(filter),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                    backgroundColor: const Color(0xFFFCF3F6),
                    selectedColor: const Color(0xFFC11336),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                      fontSize: 14,
                    ),
                    showCheckmark: false,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide.none,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // Travel Cards List
          Expanded(
            child: _filteredTravels.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.flight_takeoff,
                          size: 80,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Henüz seyahat yok',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'AI asistanından plan oluştur',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                    itemCount: _filteredTravels.length,
                    itemBuilder: (context, index) {
                      final travel = _filteredTravels[index];
                      return _buildTravelCard(travel);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTravelCard(Map<String, dynamic> travel) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section with Minimal Overlay
          Stack(
            children: [
              // Main Image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Image.network(
                  travel['image'],
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            travel['color'],
                            (travel['color'] as Color).withOpacity(0.7),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.flight_takeoff,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 200,
                      color: const Color(0xFFF5F5F5),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFC11336),
                          strokeWidth: 2.5,
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Subtle gradient overlay (only at bottom for destination text)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withOpacity(0.6),
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),

              // Status Badge
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(travel['status']),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    travel['status'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              // Minimal Destination Overlay (Apple Music style)
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Text(
                  travel['destination'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: -0.5,
                    shadows: [
                      Shadow(
                        color: Colors.black45,
                        offset: Offset(0, 2),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Content Section
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 6),
                    Text(
                      travel['date'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Details Row
                Row(
                  children: [
                    _buildInfoChip(
                      Icons.access_time,
                      travel['days'],
                      const Color(0xFFFCF3F6),
                    ),
                    const SizedBox(width: 8),
                    _buildInfoChip(
                      Icons.local_activity_outlined,
                      '${travel['activities']} Aktivite',
                      const Color(0xFFFDF5F7),
                    ),
                    const SizedBox(width: 8),
                    _buildInfoChip(
                      Icons.monetization_on_outlined,
                      travel['budget'],
                      const Color(0xFFFCF3F6),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _showTravelDetails(travel);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC11336),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        icon: const Icon(Icons.visibility_outlined, size: 18),
                        label: const Text(
                          'Detaylar',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFCF3F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {
                          _editTravel(travel);
                        },
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: Color(0xFFC11336),
                          size: 20,
                        ),
                        padding: const EdgeInsets.all(12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label, Color bgColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 14, color: const Color(0xFF666666)),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF666666),
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTravelDetails(Map<String, dynamic> travel) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E0E0),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                travel['destination'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              _buildDetailRow(Icons.calendar_today, 'Tarih', travel['date']),
              const SizedBox(height: 12),
              _buildDetailRow(Icons.access_time, 'Süre', travel['days']),
              const SizedBox(height: 12),
              _buildDetailRow(
                Icons.local_activity,
                'Aktiviteler',
                '${travel['activities']} aktivite planlandı',
              ),
              const SizedBox(height: 12),
              _buildDetailRow(Icons.monetization_on, 'Bütçe', travel['budget']),
              const SizedBox(height: 12),
              _buildDetailRow(Icons.info_outline, 'Durum', travel['status']),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC11336),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Kapat',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFFCD5970)),
        const SizedBox(width: 12),
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
          ),
        ),
      ],
    );
  }

  void _editTravel(Map<String, dynamic> travel) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TravelEditPage(travel: travel)),
    );
  }
}
