import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/widgets/hero_banner/hero_banner.dart';
import 'package:ai_smart_home_design/widgets/responsive_container/responsive_container.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController pc = PageController();
  int i = 0;

  static const pages = [
    (Icons.landscape, 'Plan from scratch', 'Start with your plot and build step by step.'),
    (Icons.construction, 'Watch it get built', 'Visualize every construction stage.'),
    (Icons.view_in_ar, '2D, 3D & interiors', 'Explore floor plans, 3D views and smart decor ideas.'),
  ];

  @override
  void dispose() {
    pc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveContainer(
          maxWidth: 600,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                  child: const Text('Skip'),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pc,
                  onPageChanged: (v) => setState(() => i = v),
                  children: [
                    for (final p in pages)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HeroBanner(p.$1, '', h: 220),
                            const SizedBox(height: 28),
                            Text(
                              p.$2,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: navy,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              p.$3,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14, color: Colors.black87),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: ElevatedButton(
                  onPressed: () => i == 2
                      ? Navigator.pushReplacementNamed(context, '/login')
                      : pc.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        ),
                  child: Text(i == 2 ? 'Get Started' : 'Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
