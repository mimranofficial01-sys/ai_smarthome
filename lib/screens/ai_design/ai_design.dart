import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/widgets/hero_banner/hero_banner.dart';
import 'package:ai_smart_home_design/widgets/pg/pg.dart';
import 'package:ai_smart_home_design/widgets/section_title/section_title.dart';

class AiDesign extends StatelessWidget {
  const AiDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Pg('AI Suggested Design', [
      const HeroBanner(
        Icons.auto_awesome,
        'AI Assistant Suggested Concept',
        h: 200,
        imageUrl: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
      ),
      sectionTitle('Exterior style'),
      const Text('Modern elevation, glass balcony, warm exterior lights.'),
      sectionTitle('Layout'),
      const Text('Open lounge + kitchen on ground, bedrooms above, terrace on top.'),
      sectionTitle('Space usage'),
      for (final e in {'Living': .35, 'Bedrooms': .30, 'Kitchen': .12, 'Outdoor': .23}.entries)
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          title: Text(e.key),
          subtitle: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: e.value,
              color: cyan,
              backgroundColor: navy.withValues(alpha: 0.1),
            ),
          ),
          trailing: Text('${(e.value * 100).round()}%'),
        ),
      sectionTitle('Theme'),
      const Align(
        alignment: Alignment.centerLeft,
        child: Chip(label: Text('Navy • Teal • White')),
      ),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/plan'),
        child: const Text('View 2D Plan'),
      ),
      const SizedBox(height: 8),
      ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/3d'),
        child: const Text('View 3D Model'),
      ),
      const SizedBox(height: 8),
      ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/stages'),
        child: const Text('Start Construction View'),
      ),
    ]);
  }
}
