import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/widgets/app_image/app_image.dart';
import 'package:ai_smart_home_design/widgets/responsive_container/responsive_container.dart';

class Floors extends StatefulWidget {
  const Floors({super.key});

  @override
  State<Floors> createState() => _FloorsState();
}

class _FloorsState extends State<Floors> {
  final Map<String, List<String>> f = {
    'Ground': ['Entrance', 'Lounge', 'Kitchen', 'Garage'],
    'First': ['Master bedroom', 'Kids room', 'Balcony'],
    'Second': ['Terrace', 'Study room'],
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Floor Layout & Spaces'),
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
          child: TabBarView(
            children: [
              for (final e in f.entries)
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Container(
                      height: 120,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: grad,
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          const AppImage(
                            imageUrl: 'https://images.unsplash.com/photo-1503387762-592deb58ef4e',
                            fit: BoxFit.cover,
                          ),
                          Container(color: navy.withValues(alpha: 0.65)),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.grid_view, color: Colors.white, size: 36),
                              SizedBox(height: 6),
                              Text(
                                'Floor Layout Arrangement',
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
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        for (final r in e.value)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: grad,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.home, color: Colors.white, size: 16),
                                const SizedBox(width: 8),
                                Text(
                                  r,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () => setState(() => e.value.remove(r)),
                                  child: const Icon(Icons.close, color: Colors.white70, size: 16),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton.icon(
                      onPressed: () => setState(() => e.value.add('New space')),
                      icon: const Icon(Icons.add),
                      label: const Text('Add space'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () => Navigator.pushNamed(context, '/ai'),
                      icon: const Icon(Icons.auto_awesome),
                      label: const Text('AI suggest arrangement'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
