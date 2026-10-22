import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/widgets/hero_banner/hero_banner.dart';
import 'package:ai_smart_home_design/widgets/pg/pg.dart';
import 'package:ai_smart_home_design/widgets/section_title/section_title.dart';

class FinalHome extends StatelessWidget {
  const FinalHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Pg('Final Completed Home', [
      const HeroBanner(
        Icons.home,
        'Villa Noor — Completed',
        h: 220,
        imageUrl: 'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c',
      ),
      sectionTitle('Journey'),
      for (final s in [
        'Plot selected',
        'Structure completed',
        'Floors planned',
        'Rooms created',
        'Interior designed',
        'Furniture added',
        'Decoration completed',
        'Exterior finished',
      ])
        ListTile(
          dense: true,
          leading: const Icon(Icons.check_circle, color: cyan),
          title: Text(s),
        ),
      sectionTitle('Summary'),
      const Text(
        'Ground: 7 spaces • First: 4 spaces • Second: 2 spaces\nTheme: Modern • Status: Saved',
        style: TextStyle(height: 1.4),
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          for (final a in [
            (Icons.share, 'Share'),
            (Icons.download, 'Export'),
            (Icons.save, 'Save'),
          ])
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(a.$1, size: 18),
                    label: Text(a.$2),
                  ),
                ),
              ),
            ),
        ],
      ),
    ]);
  }
}
