import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/widgets/responsive_container/responsive_container.dart';

class Plan2D extends StatelessWidget {
  const Plan2D({super.key});

  static const plans = {
    'Ground': [
      (Rect.fromLTWH(.02, .02, .45, .3), 'Lounge'),
      (Rect.fromLTWH(.49, .02, .49, .3), 'Drawing room'),
      (Rect.fromLTWH(.02, .34, .3, .3), 'Kitchen'),
      (Rect.fromLTWH(.34, .34, .2, .3), 'Entrance'),
      (Rect.fromLTWH(.56, .34, .42, .3), 'Washroom'),
      (Rect.fromLTWH(.02, .66, .5, .32), 'Garage'),
      (Rect.fromLTWH(.54, .66, .44, .32), 'Lawn'),
    ],
    'First': [
      (Rect.fromLTWH(.02, .02, .55, .45), 'Master bedroom'),
      (Rect.fromLTWH(.59, .02, .39, .45), 'Powder washroom'),
      (Rect.fromLTWH(.02, .5, .5, .48), 'Kids room'),
      (Rect.fromLTWH(.54, .5, .44, .48), 'Balcony'),
    ],
    'Second': [
      (Rect.fromLTWH(.02, .02, .96, .5), 'Terrace'),
      (Rect.fromLTWH(.02, .54, .96, .44), 'Pool'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('2D Floor Plan'),
          bottom: const TabBar(
            indicatorColor: cyan,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(text: 'Ground'),
              Tab(text: 'First'),
              Tab(text: 'Second'),
            ],
          ),
        ),
        body: ResponsiveContainer(
          maxWidth: 900,
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    for (final p in plans.values)
                      InteractiveViewer(
                        maxScale: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: AspectRatio(
                              aspectRatio: 1.1,
                              child: CustomPaint(
                                painter: PlanPainter(p),
                                size: Size.infinite,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pushNamed(context, '/floors'),
                        child: const Text('Edit layout'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/3d'),
                        child: const Text('Switch to 3D'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanPainter extends CustomPainter {
  final List<(Rect, String)> rooms;
  PlanPainter(this.rooms);

  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint()..color = Colors.white;
    final line = Paint()
      ..color = navy
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    for (final r in rooms) {
      final rect = Rect.fromLTWH(
        r.$1.left * size.width,
        r.$1.top * size.height,
        r.$1.width * size.width,
        r.$1.height * size.height,
      );
      canvas.drawRect(rect, fill);
      canvas.drawRect(rect, line);

      final tp = TextPainter(
        text: TextSpan(
          text: r.$2,
          style: const TextStyle(
            color: navy,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: (rect.width - 6).clamp(0, double.infinity));

      tp.paint(canvas, rect.center - Offset(tp.width / 2, tp.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
