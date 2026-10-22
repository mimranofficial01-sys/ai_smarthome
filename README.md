# AI Smart Home Design (Flutter)

## Setup
1. Install Flutter: https://docs.flutter.dev/get-started/install
2. In this folder run:  `flutter create .`   (generates android/ios folders, keeps lib/ and pubspec.yaml)
3. `flutter pub get`
4. `flutter run`

## Logo
`assets/logo.png` is a placeholder. Replace it with your real logo (same file name).

## Project structure (one folder per file)
```
lib/
├── main.dart
├── app/app/app.dart                      # MaterialApp + theme
├── routes/app_routes/app_routes.dart     # all named routes
├── constants/app_constants/              # colours + gradient
├── data/stage_data/                      # construction stage list
├── widgets/   logo, pg, hero_banner, section_title, input_field, chips, project_card
└── screens/   splash, onboarding, auth, shell, dashboard, new_project, requirements,
               floors, ai_design, stages, stage_detail, plan_2d, view_3d, walk,
               catalog, final_home, projects, chat, profile
```
Each folder contains a single `.dart` file named after the folder.
