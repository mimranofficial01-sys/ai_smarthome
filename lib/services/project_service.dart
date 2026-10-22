import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/models/project_model.dart';

/// Centralized reactive project repository and state manager.
class ProjectService {
  ProjectService._() {
    _initInitialProjects();
  }
  static final ProjectService instance = ProjectService._();

  final ValueNotifier<List<ProjectModel>> projectsNotifier = ValueNotifier<List<ProjectModel>>([]);
  final ValueNotifier<ProjectModel?> currentProjectNotifier = ValueNotifier<ProjectModel?>(null);

  void _initInitialProjects() {
    final now = DateTime.now();
    projectsNotifier.value = [
      ProjectModel(
        id: 'proj_1',
        name: 'Villa Noor',
        sub: '10 Marla • 2 floors',
        progress: 0.6,
        imageUrl: 'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9',
        createdAt: now.subtract(const Duration(days: 10)),
        updatedAt: now.subtract(const Duration(minutes: 5)),
      ),
      ProjectModel(
        id: 'proj_2',
        name: 'City Residency',
        sub: '02 Jul 2026 • Planning',
        progress: 0.25,
        imageUrl: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
        createdAt: now.subtract(const Duration(days: 15)),
        updatedAt: now.subtract(const Duration(days: 2)),
      ),
      ProjectModel(
        id: 'proj_3',
        name: 'Farm House',
        sub: '18 May 2026 • Completed',
        progress: 1.0,
        imageUrl: 'https://images.unsplash.com/photo-1600566753376-12c8ab7fb75b',
        createdAt: now.subtract(const Duration(days: 30)),
        updatedAt: now.subtract(const Duration(days: 5)),
      ),
    ];
  }

  /// Returns projects ordered by updatedAt descending (most recent first).
  List<ProjectModel> get sortedProjects {
    final list = List<ProjectModel>.from(projectsNotifier.value);
    list.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return list;
  }

  /// The most recently modified project, or null if no projects exist.
  ProjectModel? get recentProject {
    final sorted = sortedProjects;
    return sorted.isNotEmpty ? sorted.first : null;
  }

  /// Create or update a project. Updates updatedAt timestamp.
  void saveProject(ProjectModel project) {
    final list = List<ProjectModel>.from(projectsNotifier.value);
    final index = list.indexWhere((p) => p.id == project.id);
    final now = DateTime.now();

    if (index >= 0) {
      list[index] = project.copyWith(updatedAt: now);
    } else {
      list.add(project.copyWith(
        createdAt: project.createdAt,
        updatedAt: now,
      ));
    }

    projectsNotifier.value = list;
    currentProjectNotifier.value = project;
  }

  /// Delete a project by ID.
  bool deleteProject(String id) {
    final list = List<ProjectModel>.from(projectsNotifier.value);
    final initialLength = list.length;
    list.removeWhere((p) => p.id == id);

    if (list.length < initialLength) {
      projectsNotifier.value = list;
      if (currentProjectNotifier.value?.id == id) {
        currentProjectNotifier.value = null;
      }
      return true;
    }
    return false;
  }

  /// Select active project.
  void setCurrentProject(ProjectModel? project) {
    if (project != null) {
      // Touch updatedAt timestamp when resuming an existing design
      saveProject(project);
    } else {
      currentProjectNotifier.value = null;
    }
  }

  /// Create a fresh draft project model.
  ProjectModel createNewProject({String name = 'New Smart Home', String sub = '5 Marla • Fresh design'}) {
    final now = DateTime.now();
    return ProjectModel(
      id: 'proj_${now.millisecondsSinceEpoch}',
      name: name,
      sub: sub,
      progress: 0.1,
      imageUrl: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
      createdAt: now,
      updatedAt: now,
    );
  }
}
