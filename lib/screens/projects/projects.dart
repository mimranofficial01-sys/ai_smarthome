import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/models/project_model.dart';
import 'package:ai_smart_home_design/services/project_service.dart';
import 'package:ai_smart_home_design/widgets/pg/pg.dart';
import 'package:ai_smart_home_design/widgets/project_card/project_card.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Pg('My Projects', [
      ValueListenableBuilder<List<ProjectModel>>(
        valueListenable: ProjectService.instance.projectsNotifier,
        builder: (context, projects, _) {
          final sorted = ProjectService.instance.sortedProjects;

          if (sorted.isEmpty) {
            return Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.center,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.folder_open, size: 64, color: Colors.grey),
                  SizedBox(height: 12),
                  Text(
                    'No saved projects yet',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Create a new project from the Home dashboard to get started.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              for (final p in sorted)
                ProjectCard(
                  p.name,
                  p.sub,
                  p.progress,
                  imageUrl: p.imageUrl,
                  onTap: () {
                    ProjectService.instance.setCurrentProject(p);
                    Navigator.pushNamed(context, '/stages');
                  },
                  onDelete: () {
                    final name = p.name;
                    ProjectService.instance.deleteProject(p.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Project "$name" deleted'),
                        backgroundColor: navy,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
            ],
          );
        },
      ),
    ]);
  }
}
