import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';

class Logo extends StatelessWidget {
  final double size;
  const Logo({super.key, this.size = 90});
  @override
  Widget build(BuildContext c) => ClipRRect(
        borderRadius: BorderRadius.circular(size * 0.25),
        child: Image.asset('assets/logo.jpeg',
            height: size,
            width: size,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Icon(Icons.home_work_rounded, size: size, color: cyan)),
      );
}
