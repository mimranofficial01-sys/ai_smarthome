import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/app/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Optimize image cache for buttery smooth 60fps rendering and zero lag
  PaintingBinding.instance.imageCache.maximumSize = 150;
  PaintingBinding.instance.imageCache.maximumSizeBytes = 75 * 1024 * 1024; // 75 MB
  runApp(const App());
}
