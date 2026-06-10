import 'package:flutter/material.dart';
import 'package:wisata_bandung/model/tourism_place.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.tourismPlace});

  final TourismPlace tourismPlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmallScreen = constraints.maxWidth <= 600;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: isSmallScreen
                  ? DetailBodyMobile(tourismPlace: tourismPlace)
                  : DetailBodyWide(tourismPlace: tourismPlace),
            );
          },
        ),
      ),
    );
  }
}

// 📱 TAMPILAN HP (ke bawah)
class DetailBodyMobile extends StatelessWidget {
  const DetailBodyMobile({super.key, required this.tourismPlace});

  final TourismPlace tourismPlace;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Tombol kembali
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        // Gambar utama
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(tourismPlace.imageHeader),
        ),
        const SizedBox(height: 16),
        // Judul
        Text(
          tourismPlace.name,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        // Info (jam, harga, dll)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInfo(Icons.calendar_today, tourismPlace.openDays),
            _buildInfo(Icons.access_time, tourismPlace.openTime),
            _buildInfo(Icons.monetization_on, tourismPlace.ticketPrice),
          ],
        ),
        const SizedBox(height: 16),
        // Deskripsi
        Text(tourismPlace.description, textAlign: TextAlign.center),
        const SizedBox(height: 16),
        // Galeri gambar
        const Text(
          'Galeri',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: tourismPlace.imageUrls.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  tourismPlace.imageUrls[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildInfo(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.deepPurple),
        const SizedBox(height: 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// 💻 TAMPILAN WEB/LEBAR (sampingan)
class DetailBodyWide extends StatelessWidget {
  const DetailBodyWide({super.key, required this.tourismPlace});

  final TourismPlace tourismPlace;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Kolom kiri: gambar
        Expanded(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(tourismPlace.imageHeader),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: tourismPlace.imageUrls.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(tourismPlace.imageUrls[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 24),
        // Kolom kanan: info
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tourismPlace.name,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.deepPurple),
                      const SizedBox(width: 8),
                      Text(tourismPlace.openDays),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.deepPurple),
                      const SizedBox(width: 8),
                      Text(tourismPlace.openTime),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.monetization_on, color: Colors.deepPurple),
                      const SizedBox(width: 8),
                      Text(tourismPlace.ticketPrice),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 12),
                  Text(
                    tourismPlace.description,
                    style: const TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
