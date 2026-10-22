import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/services/auth_service.dart';
import 'package:ai_smart_home_design/widgets/pg/pg.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Pg('Profile & Settings', [
      const Center(
        child: CircleAvatar(
          radius: 40,
          backgroundColor: royal,
          child: Icon(Icons.person, size: 40, color: Colors.white),
        ),
      ),
      const Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text('Ahmed Khan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ),
      const SizedBox(height: 12),
      const ListTile(leading: Icon(Icons.favorite, color: royal), title: Text('Saved preferences')),
      SwitchListTile(
        value: false,
        onChanged: (_) {},
        secondary: const Icon(Icons.dark_mode, color: royal),
        title: const Text('Dark theme'),
      ),
      SwitchListTile(
        value: true,
        onChanged: (_) {},
        secondary: const Icon(Icons.notifications, color: royal),
        title: const Text('Notifications'),
      ),
      const ListTile(leading: Icon(Icons.manage_accounts, color: royal), title: Text('Account settings')),
      ListTile(
        leading: const Icon(Icons.logout, color: Colors.redAccent),
        title: const Text('Logout', style: TextStyle(color: Colors.redAccent)),
        onTap: () {
          AuthService.instance.logout();
          Navigator.pushReplacementNamed(context, '/login');
        },
      ),
    ]);
  }
}
