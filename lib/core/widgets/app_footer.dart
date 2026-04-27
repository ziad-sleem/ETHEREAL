import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      color: const Color(0xFFF9F9F9),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Branding
          const AppText(
            text: "ETHEREAL ATELIER",
            textSize: 18,
            textWeight: FontWeight.bold,
            spacing: 2,
          ),
          const SizedBox(height: 24),
          const AppText(
            text:
                "Defining the landscape of modern luxury through conscious design and unparalleled craftsmanship.",
            textColor: Colors.grey,
            textSize: 14,
            maxLineText: 3,
            spacing: 1.1,
          ),
          const SizedBox(height: 48),

          // 2. Links Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Column 1: EXPERIENCE
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: "EXPERIENCE",
                      textSize: 12,
                      textWeight: FontWeight.bold,
                      spacing: 1.5,
                    ),
                    const SizedBox(height: 16),
                    _footerLink("Collections"),
                    _footerLink("Journal"),
                    _footerLink("Atelier"),
                  ],
                ),
              ),

              // Column 2: CLIENT CARE
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: "CLIENT CARE",
                      textSize: 12,
                      textWeight: FontWeight.bold,
                      spacing: 1.5,
                    ),
                    const SizedBox(height: 16),
                    _footerLink("Support"),
                    _footerLink("Privacy"),
                    _footerLink("Legal"),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // 3. Social Section
          const AppText(
            text: "SOCIAL",
            textSize: 12,
            textWeight: FontWeight.bold,
            spacing: 1.5,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.public, size: 20, color: Colors.grey.shade700),
              const SizedBox(width: 20),
              Icon(
                Icons.camera_alt_outlined,
                size: 20,
                color: Colors.grey.shade700,
              ),
              const SizedBox(width: 20),
              Icon(Icons.mail_outline, size: 20, color: Colors.grey.shade700),
            ],
          ),

          const SizedBox(height: 60),
          const Divider(),
          const SizedBox(height: 40),

          // 4. Bottom Line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(
                text: "© 2026 ETHEREAL\nATELIER",
                textSize: 10,
                textColor: Colors.grey,
                spacing: 1,
              ),
              const AppText(
                text: "LONDON • PARIS •\nMILAN",
                textSize: 10,
                textColor: Colors.grey,
                textAlign: TextAlign.end,
                spacing: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: AppText(
        text: text,
        textSize: 14,
        textColor: Colors.grey.shade700,
        spacing: 1,
      ),
    );
  }
}
