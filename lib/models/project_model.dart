class ProjectModel {
  final String id;
  final String name;
  final String sub;
  final double progress;
  final String? imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Map<String, dynamic>? designData;

  ProjectModel({
    required this.id,
    required this.name,
    required this.sub,
    required this.progress,
    this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    this.designData,
  });

  ProjectModel copyWith({
    String? id,
    String? name,
    String? sub,
    double? progress,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? designData,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
      sub: sub ?? this.sub,
      progress: progress ?? this.progress,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      designData: designData ?? this.designData,
    );
  }
}
