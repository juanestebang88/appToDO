import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_todo_app_r5/screens/screens.dart';
class MyAppView extends StatelessWidget{
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InstaX',
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return state.status == AuthenticationStatus.authenticated
            ?HomeScreen()
            :LoginScreen();
        }
      ),
    );
  }
}