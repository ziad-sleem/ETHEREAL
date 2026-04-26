import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class DirectorWidget extends StatelessWidget {
  const DirectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        children: [
          // 1. Tag
          const AppText(
            text: "IN CONVERSATION",
            textSize: 12,
            textWeight: FontWeight.bold,
            spacing: 2,
            textColor: Color(0xFF8C6D34),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // 2. Title
          const AppText(
            text: "A Word from the\nCreative Director",
            textSize: 32,
            textAlign: TextAlign.center,
            textWeight: FontWeight.bold,
            maxLineText: 2,
          ),
          const SizedBox(height: 32),

          // 3. The Quote
          const AppText(
            text:
                "“We believe that luxury is not defined by excess, but by the quiet power of exceptional materials and the hands that shape them into stories.”",
            textSize: 18,
            textAlign: TextAlign.center,
            textColor: Color(0xFF6B6B6B),
            maxLineText: 5,
          ),
          const SizedBox(height: 48),

          // 4. Secondary Label
          const AppText(
            text:
                "MARCELLO VERDI EXPLORES THE INTERSECTION OF HERITAGE AND INNOVATION IN THE NEW AUTUMN/WINTER '24 COLLECTION.",
            textSize: 11,
            textAlign: TextAlign.center,
            spacing: 1.5,
            textColor: Colors.grey,
            maxLineText: 4,
          ),
          const SizedBox(height: 40),

          // 5. Action Button
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFF8C6D34), width: 1.5),
                ),
              ),
              padding: const EdgeInsets.only(bottom: 4),
              child: const AppText(
                text: "READ THE INTERVIEW",
                textColor: Color(0xFF8C6D34),
                textSize: 12,
                textWeight: FontWeight.bold,
                spacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
