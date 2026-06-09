import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  final informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Gambar utama (aset lokal)
              Image.asset("assets/images/farm-house.jpg"),

              // Judul
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: Text(
                  'Farm House Lembang',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Staatliches",
                  ),
                ),
              ),

              // Informasi (Jam, Harga, dll)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 8,
                        children: [
                          Icon(Icons.calendar_today),
                          Text(
                            'Open Everyday',
                            textAlign: TextAlign.center,
                            style: informationTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: 8,
                        children: [
                          Icon(Icons.access_time),
                          Text(
                            '09:00 - 20:00',
                            textAlign: TextAlign.center,
                            style: informationTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: 8,
                        children: [
                          Icon(Icons.monetization_on),
                          Text(
                            'Rp 25.000',
                            textAlign: TextAlign.center,
                            style: informationTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Deskripsi
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),

              // Galeri gambar horizontal
              SizedBox(
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 8,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg',
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
