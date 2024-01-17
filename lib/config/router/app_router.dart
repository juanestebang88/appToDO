
import 'package:flutter_todo_app_r5/presentation/screens/login_screem.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (__, state) => const LoginScreen()
    )
  ]
);