import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/screens/splash/splash.dart';
import 'package:ai_smart_home_design/screens/onboarding/onboarding.dart';
import 'package:ai_smart_home_design/screens/auth/auth.dart';
import 'package:ai_smart_home_design/screens/shell/shell.dart';
import 'package:ai_smart_home_design/screens/new_project/new_project.dart';
import 'package:ai_smart_home_design/screens/requirements/requirements.dart';
import 'package:ai_smart_home_design/screens/floors/floors.dart';
import 'package:ai_smart_home_design/screens/ai_design/ai_design.dart';
import 'package:ai_smart_home_design/screens/stages/stages.dart';
import 'package:ai_smart_home_design/screens/plan_2d/plan_2d.dart';
import 'package:ai_smart_home_design/screens/view_3d/view_3d.dart';
import 'package:ai_smart_home_design/screens/walk/walk.dart';
import 'package:ai_smart_home_design/screens/catalog/catalog.dart';
import 'package:ai_smart_home_design/screens/final_home/final_home.dart';

class AppRoutes {
  AppRoutes._();

  static final Map<String, WidgetBuilder> routes = {
    '/': (_) => const Splash(),
    '/onboard': (_) => const Onboarding(),
    '/login': (_) => const Auth(login: true),
    '/register': (_) => const Auth(login: false),
    '/home': (_) => const Shell(),
    '/new': (_) => const NewProject(),
    '/rooms': (_) => const Requirements(),
    '/floors': (_) => const Floors(),
    '/ai': (_) => const AiDesign(),
    '/stages': (_) => const Stages(),
    '/plan': (_) => const Plan2D(),
    '/3d': (_) => const View3D(),
    '/walk': (_) => const Walk(),
    '/interior': (_) => const Catalog('Interior Design', Icons.format_paint, {
          'Theme': ['Modern', 'Classic', 'Luxury', 'Minimal', 'Contemporary'],
          'Walls / Paint': ['Ivory', 'Navy', 'Teal', 'Grey'],
          'Flooring': ['Marble', 'Wood', 'Tiles'],
          'Ceiling': ['False ceiling', 'Plain', 'Wooden'],
          'Curtains': ['Sheer', 'Velvet', 'Blinds'],
          'Lights': ['Chandelier', 'Spot', 'LED strip'],
        }),
    '/furniture': (_) => const Catalog('Furniture Placement', Icons.chair, {
          'Room': ['Lounge', 'Drawing room', 'Bedroom', 'Dining', 'Kitchen'],
          'Category': ['Sofa', 'Bed', 'Wardrobe', 'Center table', 'Dining table', 'Side table', 'Chairs', 'Cabinet', 'TV unit', 'Decor'],
        }),
    '/decor': (_) => const Catalog('Decoration & Styling', Icons.local_florist, {
          'Wall': ['Paintings', 'Wall art', 'Mirrors'],
          'Living': ['Flowers', 'Plants', 'Lamps', 'Rugs', 'Accessories'],
        }),
    '/exterior': (_) => const Catalog('Exterior Features', Icons.villa, {
          'Elevation': ['Modern', 'Luxury', 'Minimal', 'Villa-style'],
          'Features': ['Garage', 'Car porch', 'Lawn', 'Pool', 'Garden', 'Balcony', 'Terrace', 'Exterior lights'],
        }, multi: true),
    '/final': (_) => const FinalHome(),
  };
}
