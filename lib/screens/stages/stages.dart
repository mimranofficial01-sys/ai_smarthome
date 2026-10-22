import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/data/stage_data/stage_data.dart';
import 'package:ai_smart_home_design/screens/stage_detail/stage_detail.dart';
import 'package:ai_smart_home_design/widgets/hero_banner/hero_banner.dart';
import 'package:ai_smart_home_design/widgets/pg/pg.dart';

class Stages extends StatefulWidget {
  const Stages({super.key});

  @override
  State<Stages> createState() => _StagesState();
}

class _StagesState extends State<Stages> {
  int cur = 3;

  @override
  Widget build(BuildContext context) {
    return Pg('Construction Stages', [
      HeroBanner(
        stageData[cur].$2,
        'Stage ${cur + 1}: ${stageData[cur].$1}',
        h: 200,
        imageUrl: 'https://images.unsplash.com/photo-1541888946425-d0fbb18f86c5',
      ),
      const SizedBox(height: 14),
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: LinearProgressIndicator(
          value: (cur + 1) / 10,
          minHeight: 8,
          color: cyan,
          backgroundColor: navy.withValues(alpha: 0.1),
        ),
      ),
      const SizedBox(height: 6),
      Text(
        '${((cur + 1) * 10)}% complete',
        style: const TextStyle(fontWeight: FontWeight.w600, color: navy),
      ),
      const SizedBox(height: 14),
      SizedBox(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, i) => GestureDetector(
            onTap: () => setState(() => cur = i),
            onDoubleTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => StageDetail(i)),
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 100,
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: i <= cur ? royal : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    stageData[i].$2,
                    color: i <= cur ? Colors.white : navy,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${i + 1}. ${stageData[i].$1}',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: i == cur ? FontWeight.bold : FontWeight.normal,
                      color: i <= cur ? Colors.white : navy,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 16),
      ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => StageDetail(cur)),
        ),
        child: const Text('Open stage details'),
      ),
    ]);
  }
}
