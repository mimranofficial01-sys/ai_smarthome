import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/widgets/app_image/app_image.dart';

class HeroBanner extends StatelessWidget {
  final IconData icon;
  final String text;
  final double h;
  final String? imageUrl;

  const HeroBanner(
    this.icon,
    this.text, {
    super.key,
    this.h = 180,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: grad,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (imageUrl != null) ...[
            AppImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
            Container(
              color: navy.withValues(alpha: 0.55),
            ),
          ],
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: h > 160 ? 56 : 42, color: Colors.white),
                  if (text.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
