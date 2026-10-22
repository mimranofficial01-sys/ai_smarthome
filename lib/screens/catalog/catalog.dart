import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/widgets/chips/chips.dart';
import 'package:ai_smart_home_design/widgets/hero_banner/hero_banner.dart';
import 'package:ai_smart_home_design/widgets/pg/pg.dart';
import 'package:ai_smart_home_design/widgets/section_title/section_title.dart';

class Catalog extends StatelessWidget {
  final String title;
  final IconData icon;
  final Map<String, List<String>> sections;
  final bool multi;

  const Catalog(
    this.title,
    this.icon,
    this.sections, {
    super.key,
    this.multi = false,
  });

  @override
  Widget build(BuildContext context) {
    String? img;
    if (title.contains('Interior')) {
      img = 'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6';
    } else if (title.contains('Furniture')) {
      img = 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc';
    } else if (title.contains('Decoration')) {
      img = 'https://images.unsplash.com/photo-1513694203232-719a280e022f';
    } else if (title.contains('Exterior')) {
      img = 'https://images.unsplash.com/photo-1600566753376-12c8ab7fb75b';
    }

    return Pg(title, [
      HeroBanner(icon, '$title Live Preview', h: 180, imageUrl: img),
      for (final e in sections.entries) ...[
        sectionTitle(e.key),
        Chips(
          e.value,
          multi: multi ||
              (e.key != sections.keys.first &&
                  e.key != 'Room' &&
                  e.key != 'Theme' &&
                  e.key != 'Elevation'),
        ),
      ],
      const SizedBox(height: 24),
      ElevatedButton.icon(
        onPressed: () => Navigator.pushNamed(context, '/ai'),
        icon: const Icon(Icons.auto_awesome),
        label: const Text('AI suggestion'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Apply'),
      ),
    ]);
  }
}
