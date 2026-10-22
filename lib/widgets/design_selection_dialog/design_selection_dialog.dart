import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/services/project_service.dart';

/// Shows the "What would you like to do?" dialog allowing the user
/// to select between creating a new design or continuing an existing design.
void showDesignSelectionDialog(BuildContext context, {String defaultRoute = '/new'}) {
  final projects = ProjectService.instance.sortedProjects;

  if (projects.isEmpty) {
    final newProj = ProjectService.instance.createNewProject();
    ProjectService.instance.saveProject(newProj);
    Navigator.pushNamed(context, defaultRoute);
    return;
  }

  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text(
        'What would you like to do?',
        style: TextStyle(fontWeight: FontWeight.bold, color: navy, fontSize: 18),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose whether to start a fresh project or continue an existing saved design:',
              style: TextStyle(fontSize: 13, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: royal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.add_circle_outline, size: 20),
              label: const Text('Option 1 — Create New Design'),
              onPressed: () {
                Navigator.pop(dialogContext);
                final newProj = ProjectService.instance.createNewProject();
                ProjectService.instance.saveProject(newProj);
                Navigator.pushNamed(context, defaultRoute);
              },
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: royal,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                side: const BorderSide(color: royal),
              ),
              icon: const Icon(Icons.folder_open, size: 20),
              label: const Text('Option 2 — Continue Existing Design'),
              onPressed: () {
                Navigator.pop(dialogContext);
                _showProjectPicker(context, defaultRoute == '/new' ? '/stages' : defaultRoute);
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: const Text('Option 3 — Cancel'),
        ),
      ],
    ),
  );
}

void _showProjectPicker(BuildContext context, String targetRoute) {
  final projects = ProjectService.instance.sortedProjects;
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('Select Saved Project', style: TextStyle(fontWeight: FontWeight.bold, color: navy)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: projects.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final p = projects[index];
            return ListTile(
              title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold, color: navy)),
              subtitle: Text(p.sub, style: const TextStyle(fontSize: 12)),
              trailing: const Icon(Icons.chevron_right, color: royal),
              onTap: () {
                Navigator.pop(dialogContext);
                ProjectService.instance.setCurrentProject(p);
                Navigator.pushNamed(context, targetRoute);
              },
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: const Text('Cancel'),
        ),
      ],
    ),
  );
}
