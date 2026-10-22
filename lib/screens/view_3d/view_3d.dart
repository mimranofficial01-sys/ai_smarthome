import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/widgets/app_image/app_image.dart';
import 'package:ai_smart_home_design/widgets/chips/chips.dart';
import 'package:ai_smart_home_design/widgets/pg/pg.dart';
import 'package:ai_smart_home_design/widgets/section_title/section_title.dart';

class View3D extends StatefulWidget {
  const View3D({super.key});

  @override
  State<View3D> createState() => _View3DState();
}

class _View3DState extends State<View3D> {
  double rot = 0;
  double zoom = 1;

  @override
  Widget build(BuildContext context) {
    return Pg('3D Home View', [
      GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            rot += details.delta.dx * 0.01;
          });
        },
        child: Container(
          height: 260,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            gradient: grad,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              const AppImage(
                imageUrl: 'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9',
                fit: BoxFit.cover,
              ),
              Container(color: navy.withValues(alpha: 0.65)),
              Center(
                child: Transform.scale(
                  scale: zoom,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, .001)
                      ..rotateY(rot),
                    child: const Icon(
                      Icons.home_work,
                      size: 140,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.touch_app, color: Colors.white70, size: 14),
                      SizedBox(width: 4),
                      Text(
                        'Drag to rotate 360°',
                        style: TextStyle(color: Colors.white70, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 10),
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => setState(() => rot -= .4),
              icon: const Icon(Icons.rotate_left),
              tooltip: 'Rotate Left',
            ),
            IconButton(
              onPressed: () => setState(() => rot += .4),
              icon: const Icon(Icons.rotate_right),
              tooltip: 'Rotate Right',
            ),
            IconButton(
              onPressed: () => setState(() => zoom = (zoom + .15).clamp(.5, 2.0)),
              icon: const Icon(Icons.zoom_in),
              tooltip: 'Zoom In',
            ),
            IconButton(
              onPressed: () => setState(() => zoom = (zoom - .15).clamp(.5, 2.0)),
              icon: const Icon(Icons.zoom_out),
              tooltip: 'Zoom Out',
            ),
            IconButton(
              onPressed: () => setState(() {
                rot = 0;
                zoom = 1;
              }),
              icon: const Icon(Icons.restart_alt),
              tooltip: 'Reset View',
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      const Chips(['Exterior', 'Interior', 'Floor-wise']),
      sectionTitle('Floors'),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final f in ['Ground Floor', 'First Floor', 'Second Floor'])
            ActionChip(
              label: Text(f),
              onPressed: () {},
            ),
        ],
      ),
      const SizedBox(height: 16),
      ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/walk'),
        child: const Text('Walkthrough'),
      ),
      const SizedBox(height: 8),
      OutlinedButton(
        onPressed: () => Navigator.pushNamed(context, '/interior'),
        child: const Text('Customize Interior'),
      ),
    ]);
  }
}
