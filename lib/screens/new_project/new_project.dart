import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/services/project_service.dart';
import 'package:ai_smart_home_design/widgets/chips/chips.dart';
import 'package:ai_smart_home_design/widgets/hero_banner/hero_banner.dart';
import 'package:ai_smart_home_design/widgets/input_field/input_field.dart';
import 'package:ai_smart_home_design/widgets/pg/pg.dart';
import 'package:ai_smart_home_design/widgets/section_title/section_title.dart';

class NewProject extends StatefulWidget {
  const NewProject({super.key});

  @override
  State<NewProject> createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  final TextEditingController nameCtl = TextEditingController(text: 'My Smart Home');

  @override
  void dispose() {
    nameCtl.dispose();
    super.dispose();
  }

  void _onNext() {
    final current = ProjectService.instance.currentProjectNotifier.value;
    final projName = nameCtl.text.trim().isNotEmpty ? nameCtl.text.trim() : 'My Smart Home';

    if (current != null) {
      ProjectService.instance.saveProject(current.copyWith(name: projName));
    } else {
      final newProj = ProjectService.instance.createNewProject(name: projName);
      ProjectService.instance.saveProject(newProj);
    }
    Navigator.pushNamed(context, '/rooms');
  }

  @override
  Widget build(BuildContext context) {
    return Pg('New Project', [
      const HeroBanner(
        Icons.add_home,
        'Create New Smart Home Project',
        h: 140,
        imageUrl: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
      ),
      const SizedBox(height: 16),
      inputField('Project name', Icons.edit, controller: nameCtl),
      inputField('Plot size (Marla / sq ft)', Icons.crop_square),
      Row(
        children: [
          Expanded(child: inputField('Width (ft)', Icons.swap_horiz)),
          const SizedBox(width: 10),
          Expanded(child: inputField('Length (ft)', Icons.swap_vert)),
        ],
      ),
      sectionTitle('Plot type'),
      const Chips(['Residential', 'Corner', 'Commercial']),
      sectionTitle('Number of floors'),
      const Chips(['Ground', 'Ground + 1', 'Ground + 2']),
      sectionTitle('Orientation'),
      const Chips(['North', 'South', 'East', 'West']),
      sectionTitle('Budget range (optional)'),
      const Chips(['< 50L', '50L–1Cr', '1Cr+']),
      const SizedBox(height: 24),
      ElevatedButton(
        onPressed: _onNext,
        child: const Text('Next'),
      ),
    ]);
  }
}
