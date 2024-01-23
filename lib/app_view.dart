import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_todo_app_r5/screens/screens.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDO List App',
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state.status == AuthenticationStatus.authenticated) {
              return BlocProvider(
                create: (context) => SignInBloc(
                  userRepository: context.read<AuthenticationBloc>().userRepository
                ),
                child: const HomeScreen(),
              );
            } else {
              return const LoginScreen();
            }
          },
        ),
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.deepPurple,
            scaffoldBackgroundColor: const Color.fromARGB(255, 236, 236, 236),
            appBarTheme: const AppBarTheme(
              color: Colors.deepPurple,
              elevation: 4.0,
            )));
  }
}
