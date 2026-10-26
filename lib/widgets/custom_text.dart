
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Font Poppins dipilih karena tampilannya modern dan mudah dibaca.
// Ukuran, warna, dan ketebalan teks dapat diatur sesuai kebutuhan tampilan.
class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
