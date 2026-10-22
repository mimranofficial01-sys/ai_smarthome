import 'package:flutter/material.dart';
import 'package:ai_smart_home_design/constants/app_constants/app_constants.dart';
import 'package:ai_smart_home_design/services/auth_service.dart';
import 'package:ai_smart_home_design/widgets/input_field/input_field.dart';
import 'package:ai_smart_home_design/widgets/logo/logo.dart';
import 'package:ai_smart_home_design/widgets/responsive_container/responsive_container.dart';

class Auth extends StatelessWidget {
  final bool login;
  const Auth({super.key, required this.login});

  void _onProceed(BuildContext context) {
    AuthService.instance.login();
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveContainer(
          maxWidth: 480,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              children: [
                const Center(child: Logo(size: 80)),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    login ? 'Welcome Back' : 'Create Account',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                if (!login) inputField('Full name', Icons.person),
                inputField('Email', Icons.email, type: TextInputType.emailAddress),
                if (!login) inputField('Phone (optional)', Icons.phone, type: TextInputType.phone),
                inputField('Password', Icons.lock, obscure: true),
                if (!login) inputField('Confirm password', Icons.lock_outline, obscure: true),
                if (login)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot password?'),
                    ),
                  ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => _onProceed(context),
                  child: Text(login ? 'Login' : 'Register'),
                ),
                if (login) ...[
                  const SizedBox(height: 4),
                  TextButton(
                    onPressed: () => _onProceed(context),
                    child: const Text('Continue as guest'),
                  ),
                ],
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, login ? '/register' : '/login'),
                  child: Text(login ? "Don't have an account? Register" : 'Already registered? Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
