import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/widgets/app_image/app_image.dart';

class ProjectCard extends StatelessWidget {
  final String name;
  final String sub;
  final double progress;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final String? imageUrl;

  const ProjectCard(
    this.name,
    this.sub,
    this.progress, {
    super.key,
    this.onTap,
    this.onDelete,
    this.imageUrl,
  });

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Project'),
        content: Text(
          'Are you sure you want to delete "$name"? This action cannot be undone.',
          style: const TextStyle(fontSize: 14),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              minimumSize: const Size(80, 40),
            ),
            onPressed: () {
              Navigator.pop(dialogContext);
              if (onDelete != null) {
                onDelete!();
              }
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onTap: onTap,
        leading: AppImage(
          imageUrl: imageUrl,
          width: 52,
          height: 52,
          fit: BoxFit.cover,
          borderRadius: BorderRadius.circular(12),
          fallbackIcon: Icons.home_rounded,
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w600, color: navy),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(sub, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                color: cyan,
                backgroundColor: navy.withValues(alpha: 0.1),
                minHeight: 6,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onDelete != null)
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert, color: navy, size: 20),
                onSelected: (value) {
                  if (value == 'delete') {
                    _showDeleteConfirmationDialog(context);
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem<String>(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Delete Project',
                          style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            else ...[
              const Text(
                'Continue',
                style: TextStyle(
                  color: royal,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 2),
              const Icon(Icons.chevron_right, color: royal, size: 18),
            ],
          ],
        ),
      ),
    );
  }
}
