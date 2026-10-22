import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/widgets/responsive_container/responsive_container.dart';

class Pg extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const Pg(
    this.title,
    this.children, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ResponsiveContainer(
        maxWidth: 900,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: children,
        ),
      ),
    );
  }
}
