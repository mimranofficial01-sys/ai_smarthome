import 'package:flutter/material.dart';

/// Lightweight authentication service managing session state.
class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  final ValueNotifier<bool> isAuthenticatedNotifier = ValueNotifier<bool>(false);

  bool get isAuthenticated => isAuthenticatedNotifier.value;

  void login() {
    isAuthenticatedNotifier.value = true;
  }

  void logout() {
    isAuthenticatedNotifier.value = false;
  }
}
