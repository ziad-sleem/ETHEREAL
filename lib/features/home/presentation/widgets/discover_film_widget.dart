import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiscoverFilmWidget extends StatelessWidget {
  const DiscoverFilmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // 1. Background Image
        Image.asset(
          'assets/images/kaboompics_city-chic-in-autumn-casual-fall-outfit-fashion-trends-33503.jpg',
          width: double.infinity,
          height: 600,
          fit: BoxFit.cover,
        ),

        // 2. Melting Gradient Overlay (Top and Bottom)
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.4, 1.0],
                colors: [
                  Colors.white.withOpacity(0),
                  Colors.white,
                ],
              ),
            ),
          ),
        ),

        // 3. SVG Gradient Overlay (for text legibility)
        Positioned.fill(
          child: SvgPicture.asset(
            'assets/images/Gradient.svg',
            fit: BoxFit.cover,
          ),
        ),

        // 3. Content
        Positioned(
          bottom: 60,
          left: 20,
          right: 20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppText(
                text: "La Dolce Vita",
                textColor: Color(0xFF8C6D34),
                textSize: 16,
              ),
              const SizedBox(height: 8),
              const AppText(
                text: "The Silk Muse",
                textColor: Color(0xFF2D2D2D),
                textSize: 42,
                textWeight: FontWeight.w300,
              ),
              const SizedBox(height: 12),
              const AppText(
                text: 'A SYMPHONY OF ITALIAN CRAFTSMANSHIP\nAND MODERN GRACE.',
                textColor: Colors.grey,
                textSize: 10,
                textAlign: TextAlign.center,
                spacing: 1.5,
              ),
              const SizedBox(height: 32),

              // Discover Button
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF705525),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 16,
                ),
                child: const AppText(
                  text: "DISCOVER THE FILM",
                  textColor: Colors.white,
                  textSize: 12,
                  textWeight: FontWeight.bold,
                  spacing: 2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
