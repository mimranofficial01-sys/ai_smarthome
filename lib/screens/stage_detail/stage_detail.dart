import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/data/stage_data/stage_data.dart';
import 'package:ai_smart_home_design/widgets/hero_banner/hero_banner.dart';
import 'package:ai_smart_home_design/widgets/pg/pg.dart';
import 'package:ai_smart_home_design/widgets/section_title/section_title.dart';

class StageDetail extends StatelessWidget {
  final int i;
  const StageDetail(this.i, {super.key});

  @override
  Widget build(BuildContext context) {
    return Pg(stageData[i].$1, [
      HeroBanner(stageData[i].$2, 'Visual preview'),
      sectionTitle('Included in this stage'),
      for (final s in [
        'Site work & material check',
        'Core activity for ${stageData[i].$1}',
        'Quality inspection',
      ])
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.check_circle, color: cyan),
          title: Text(s),
        ),
      sectionTitle('Progress'),
      ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: LinearProgressIndicator(
          value: (i + 1) / 10,
          color: cyan,
          backgroundColor: navy.withValues(alpha: 0.1),
        ),
      ),
      sectionTitle('Before / After'),
      Row(
        children: [
          for (final t in ['Before', 'After'])
            Expanded(
              child: Container(
                height: 100,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: t == 'After' ? cyan.withValues(alpha: 0.3) : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: navy.withValues(alpha: 0.1)),
                ),
                alignment: Alignment.center,
                child: Text(
                  t,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: navy),
                ),
              ),
            ),
        ],
      ),
    ]);
  }
}
