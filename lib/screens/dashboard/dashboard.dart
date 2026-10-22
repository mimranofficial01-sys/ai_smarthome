import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/models/project_model.dart';
import 'package:ai_smart_home_design/services/project_service.dart';
import 'package:ai_smart_home_design/widgets/app_image/app_image.dart';
import 'package:ai_smart_home_design/widgets/design_selection_dialog/design_selection_dialog.dart';
import 'package:ai_smart_home_design/widgets/hero_banner/hero_banner.dart';
import 'package:ai_smart_home_design/widgets/logo/logo.dart';
import 'package:ai_smart_home_design/widgets/project_card/project_card.dart';
import 'package:ai_smart_home_design/widgets/responsive_container/responsive_container.dart';
import 'package:ai_smart_home_design/widgets/section_title/section_title.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static const tiles = [
    ('New Project', Icons.add_home, '/new', 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c'),
    ('AI Suggestions', Icons.auto_awesome, '/ai', 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750'),
    ('2D Floor Plan', Icons.grid_view, '/plan', 'https://images.unsplash.com/photo-1503387762-592deb58ef4e'),
    ('3D Home View', Icons.view_in_ar, '/3d', 'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9'),
    ('Virtual Tour', Icons.vrpano, '/walk', 'https://images.unsplash.com/photo-1600210492486-724fe5c67fb0'),
    ('Construction', Icons.construction, '/stages', 'https://images.unsplash.com/photo-1541888946425-d0fbb18f86c5'),
    ('Interior Design', Icons.chair, '/interior', 'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6'),
    ('Furniture', Icons.weekend, '/furniture', 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc'),
    ('Decoration', Icons.local_florist, '/decor', 'https://images.unsplash.com/photo-1513694203232-719a280e022f'),
    ('Exterior', Icons.villa, '/exterior', 'https://images.unsplash.com/photo-1600566753376-12c8ab7fb75b'),
    ('Final Home', Icons.verified, '/final', 'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c'),
    ('Saved Designs', Icons.bookmark, '/final', 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750'),
  ];

  static const featuredIdeas = [
    ('Modern', Icons.home, 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c'),
    ('Luxury', Icons.star, 'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c'),
    ('Minimal', Icons.spa, 'https://images.unsplash.com/photo-1600210492486-724fe5c67fb0'),
    ('Villa', Icons.villa, 'https://images.unsplash.com/photo-1600566753376-12c8ab7fb75b'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ResponsiveContainer(
        maxWidth: 1000,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              children: [
                const Logo(size: 40),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Hello, Ahmed 👋',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none, color: navy),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const HeroBanner(
              Icons.home_work,
              'Design Your Dream Home with AI',
              h: 140,
              imageUrl: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
            ),
            sectionTitle('Quick access'),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 3;
                double childAspectRatio = 1.0;

                if (constraints.maxWidth < 350) {
                  crossAxisCount = 2;
                  childAspectRatio = 1.05;
                } else if (constraints.maxWidth < 600) {
                  crossAxisCount = 3;
                  childAspectRatio = 1.0;
                } else if (constraints.maxWidth < 900) {
                  crossAxisCount = 4;
                  childAspectRatio = 1.15;
                } else {
                  crossAxisCount = 6;
                  childAspectRatio = 1.25;
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemCount: tiles.length,
                  itemBuilder: (context, index) {
                    final t = tiles[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () {
                        if (t.$3 == '/new') {
                          showDesignSelectionDialog(context, defaultRoute: '/new');
                        } else {
                          Navigator.pushNamed(context, t.$3);
                        }
                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: grad,
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            AppImage(
                              imageUrl: t.$4,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              color: navy.withValues(alpha: 0.65),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(t.$2, color: Colors.white, size: 26),
                                  const SizedBox(height: 4),
                                  Text(
                                    t.$1,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
            sectionTitle('Recent project'),
            ValueListenableBuilder<List<ProjectModel>>(
              valueListenable: ProjectService.instance.projectsNotifier,
              builder: (context, projects, _) {
                final recent = ProjectService.instance.recentProject;

                if (recent == null) {
                  return Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          const Icon(Icons.info_outline, color: cyan, size: 32),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'No recent projects',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: navy),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Tap "New Project" above to create your first design.',
                                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return ProjectCard(
                  recent.name,
                  recent.sub,
                  recent.progress,
                  imageUrl: recent.imageUrl,
                  onTap: () {
                    ProjectService.instance.setCurrentProject(recent);
                    Navigator.pushNamed(context, '/stages');
                  },
                  onDelete: () {
                    final name = recent.name;
                    ProjectService.instance.deleteProject(recent.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Project "$name" deleted'),
                        backgroundColor: navy,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                );
              },
            ),
            sectionTitle('Featured ideas'),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: featuredIdeas.length,
                itemBuilder: (context, index) {
                  final f = featuredIdeas[index];
                  return Container(
                    width: 160,
                    margin: const EdgeInsets.only(right: 12),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: grad,
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        AppImage(
                          imageUrl: f.$3,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: navy.withValues(alpha: 0.55),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(f.$2, color: Colors.white, size: 28),
                            const SizedBox(height: 6),
                            Text(
                              '${f.$1} Elevation',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
