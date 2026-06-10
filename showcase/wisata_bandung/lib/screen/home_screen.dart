import 'package:flutter/material.dart';
import 'package:wisata_bandung/model/tourism_place.dart';
import 'package:wisata_bandung/screen/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wisata Bandung',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // 🔑 Kunci utama: cek lebar layar
          final isSmallScreen = constraints.maxWidth <= 600;

          if (isSmallScreen) {
            // 📱 LAYAR KECIL (HP) → pakai ListView (ke bawah)
            return TourismPlaceList();
          } else {
            // 💻 LAYAR LEBAR (Web/Tablet) → pakai GridView (ke samping)
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: TourismPlaceGrid(),
              ),
            );
          }
        },
      ),
    );
  }
}

// ============ LIST VIEW UNTUK LAYAR KECIL ============
class TourismPlaceList extends StatelessWidget {
  const TourismPlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: tourismPlaceList.length,
      itemBuilder: (context, index) {
        final place = tourismPlaceList[index];
        return TourismPlaceCard(
          tourismPlace: place,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(tourismPlace: place),
              ),
            );
          },
        );
      },
    );
  }
}

// ============ GRID VIEW UNTUK LAYAR LEBAR ============
class TourismPlaceGrid extends StatelessWidget {
  const TourismPlaceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 350, // setiap card maksimal 350px lebar
        childAspectRatio: 0.75, // tinggi : lebar = 0.75 (sedikit lebih tinggi)
        crossAxisSpacing: 12, // jarak antar kolom
        mainAxisSpacing: 12, // jarak antar baris
      ),
      itemCount: tourismPlaceList.length,
      itemBuilder: (context, index) {
        final place = tourismPlaceList[index];
        return TourismPlaceCardGrid(
          tourismPlace: place,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(tourismPlace: place),
              ),
            );
          },
        );
      },
    );
  }
}

// ============ CARD UNTUK LIST VIEW (SAMPINGAN) ============
class TourismPlaceCard extends StatelessWidget {
  const TourismPlaceCard({
    super.key,
    required this.tourismPlace,
    required this.onTap,
  });

  final TourismPlace tourismPlace;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            // Gambar (30% lebar)
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(tourismPlace.imageHeader, fit: BoxFit.cover),
            ),
            // Teks (sisa lebar)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tourismPlace.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tourismPlace.location,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============ CARD UNTUK GRID VIEW (KOTAK) ============
class TourismPlaceCardGrid extends StatelessWidget {
  const TourismPlaceCardGrid({
    super.key,
    required this.tourismPlace,
    required this.onTap,
  });

  final TourismPlace tourismPlace;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gambar (70% tinggi card)
            Expanded(
              flex: 7,
              child: Image.asset(tourismPlace.imageHeader, fit: BoxFit.cover),
            ),
            // Teks (30% tinggi card)
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tourismPlace.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tourismPlace.location,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
