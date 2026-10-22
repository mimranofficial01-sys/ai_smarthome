import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/widgets/app_image/app_image.dart';
import 'package:ai_smart_home_design/widgets/responsive_container/responsive_container.dart';

class Requirements extends StatefulWidget {
  const Requirements({super.key});

  @override
  State<Requirements> createState() => _RequirementsState();
}

class _RequirementsState extends State<Requirements> {
  final Map<String, int> q = {
    'Entrance': 1,
    'Lounge': 0,
    'Drawing room': 0,
    'Master bedroom': 1,
    'Additional bedrooms': 0,
    'Washroom': 0,
    'Powder washroom': 0,
    'Kitchen': 1,
    'Balcony': 0,
    'Garage': 0,
    'Car porch': 0,
    'Lawn': 0,
    'Pool': 0,
    'Dining area': 0,
    'Store room': 0,
    'Terrace': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('House Requirements & Rooms')),
      body: ResponsiveContainer(
        maxWidth: 900,
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: grad,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const AppImage(
                    imageUrl: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
                    fit: BoxFit.cover,
                  ),
                  Container(color: navy.withValues(alpha: 0.65)),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.room_preferences, color: Colors.white, size: 36),
                      SizedBox(height: 6),
                      Text(
                        'Select Rooms & Spaces',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 2;
                  double childAspectRatio = 1.35;

                  if (constraints.maxWidth < 360) {
                    crossAxisCount = 2;
                    childAspectRatio = 1.15;
                  } else if (constraints.maxWidth < 600) {
                    crossAxisCount = 2;
                    childAspectRatio = 1.35;
                  } else if (constraints.maxWidth < 900) {
                    crossAxisCount = 3;
                    childAspectRatio = 1.5;
                  } else {
                    crossAxisCount = 4;
                    childAspectRatio = 1.6;
                  }

                  final items = q.entries.toList();

                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final e = items[index];
                      final isSelected = e.value > 0;

                      return InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () => setState(() {
                          q[e.key] = isSelected ? 0 : 1;
                        }),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: grad,
                            border: Border.all(
                              color: isSelected ? cyan : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              const AppImage(
                                imageUrl: 'https://images.unsplash.com/photo-1600210492486-724fe5c67fb0',
                                fit: BoxFit.cover,
                              ),
                              Container(
                                color: navy.withValues(alpha: isSelected ? 0.45 : 0.75),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      e.key,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    if (isSelected) ...[
                                      const SizedBox(height: 4),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                                              onPressed: () => setState(() {
                                                q[e.key] = e.value - 1;
                                              }),
                                              icon: const Icon(
                                                Icons.remove_circle_outline,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 6),
                                              child: Text(
                                                '${e.value}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                                              onPressed: () => setState(() {
                                                q[e.key] = e.value + 1;
                                              }),
                                              icon: const Icon(
                                                Icons.add_circle_outline,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/floors'),
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
