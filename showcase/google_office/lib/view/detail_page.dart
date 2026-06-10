import 'package:flutter/material.dart';
import '../model/google_office.dart';

class DetailPage extends StatelessWidget {
  final GoogleOffice googleOffice;
  final String? googleOfficeId;

  // Constructor sesuai starter project - TIDAK DIUBAH strukturnya
  DetailPage({super.key, GoogleOffice? googleOffice, this.googleOfficeId})
    : googleOffice = googleOffice ?? _getOfficeById(googleOfficeId);

  // Helper function untuk filter berdasarkan ID (Skilled)
  static GoogleOffice _getOfficeById(String? id) {
    if (id == null) return listOfGoogleOffice.first;
    return listOfGoogleOffice.firstWhere(
      (office) => office.id == id,
      orElse: () => listOfGoogleOffice.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack untuk gambar dan tombol back
            Stack(
              children: [
                Container(
                  height: 320,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Image.network(
                    googleOffice.image,
                    width: double.infinity,
                    height: 320,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 320,
                        color: Colors.grey[200],
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 320,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(
                            Icons.business,
                            size: 80,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
            // Konten Detail
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama kantor dengan gaya custom (Advanced)
                  Text(
                    googleOffice.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Badge Region
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue[200]!),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.public, size: 16, color: Colors.blue[700]),
                        const SizedBox(width: 6),
                        Text(
                          googleOffice.region.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  // Alamat
                  _buildInfoCard(
                    icon: Icons.location_on,
                    iconColor: Colors.red,
                    title: 'Alamat Kantor',
                    content: googleOffice.address,
                  ),
                  const SizedBox(height: 16),
                  // Telepon
                  _buildInfoCard(
                    icon: Icons.phone,
                    iconColor: Colors.green,
                    title: 'Nomor Telepon',
                    content: googleOffice.phone,
                  ),
                  const SizedBox(height: 16),
                  // Koordinat
                  _buildInfoCard(
                    icon: Icons.map,
                    iconColor: Colors.purple,
                    title: 'Koordinat GPS',
                    content:
                        'Latitude: ${googleOffice.lat}\nLongitude: ${googleOffice.lng}',
                  ),
                  const SizedBox(height: 24),
                  // Tombol Buka Maps
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Fitur Maps akan segera hadir!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.directions),
                      label: const Text('Buka Lokasi di Maps'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan info card (pakai Color.withValues untuk menghindari deprecated)
  Widget _buildInfoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withValues(
                alpha: 0.1,
              ), // Perbaikan: pakai withValues
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[500],
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
