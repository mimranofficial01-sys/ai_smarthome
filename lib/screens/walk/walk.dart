import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/widgets/app_image/app_image.dart';
import 'package:ai_smart_home_design/widgets/responsive_container/responsive_container.dart';

class Walk extends StatefulWidget {
  const Walk({super.key});

  @override
  State<Walk> createState() => _WalkState();
}

class _WalkState extends State<Walk> {
  static const rooms = [
    'Entrance',
    'Lounge',
    'Drawing room',
    'Kitchen',
    'Master bedroom',
    'Washroom',
    'Powder washroom',
    'Balcony',
    'Garage',
    'Pool area',
    'Lawn',
  ];

  int i = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      appBar: AppBar(
        title: const Text('Virtual Walkthrough'),
        backgroundColor: navy,
      ),
      body: ResponsiveContainer(
        maxWidth: 900,
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  gradient: grad,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    const AppImage(
                      imageUrl: 'https://images.unsplash.com/photo-1600210492486-724fe5c67fb0',
                      fit: BoxFit.cover,
                    ),
                    Container(color: navy.withValues(alpha: 0.65)),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.vrpano, size: 80, color: Colors.white),
                          const SizedBox(height: 10),
                          Text(
                            rooms[i],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  for (var k = 0; k < rooms.length; k++)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(rooms[k]),
                        selected: k == i,
                        onSelected: (_) => setState(() => i = k),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
