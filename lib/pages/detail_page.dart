
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_text.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final int price;
  final String description;

  const DetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.description,
  });

  // Format harga menjadi Rupiah
  String formatRupiah(int price) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const CustomText(
          text: 'Detail Menu',
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GAMBAR / IKON MENU
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.restaurant,
                size: 100,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 24),

            // NAMA MENU
            CustomText(
              text: name,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),

            const SizedBox(height: 12),

            // HARGA MENU
            CustomText(
              text: formatRupiah(price),
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),

            const SizedBox(height: 24),

            // JUDUL DESKRIPSI
            const CustomText(
              text: 'Deskripsi Menu',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),

            const SizedBox(height: 10),

            // DESKRIPSI
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
