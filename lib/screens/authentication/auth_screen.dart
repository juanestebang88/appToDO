import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_todo_app_r5/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/sign_up/sign_up_bloc.dart';

import 'package:flutter_todo_app_r5/components/components.dart';
import 'package:flutter_todo_app_r5/screens/screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 60.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              TextLabel.textBold(text: 'ToDO'),
              TextLabel.textPurpleBold(text: 'List App'),
              const SizedBox(
                height: 20.0,
              ),
              TabBarCustom.tabBar(namePages: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextLabel.textNormal(text: 'Ingresar'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextLabel.textNormal(text: 'Registrarse'),
                ),
              ], tabController: tabController),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    BlocProvider<SignInBloc>(
                      create: (context) => SignInBloc(
                        userRepository: context.read<AuthenticationBloc>().userRepository
                      ),
                      child: const SignInScreen(),
                    ),
                    BlocProvider<SignUpBloc>(
                      create: (context) => SignUpBloc(
                        userRepository: context.read<AuthenticationBloc>().userRepository
                      ),
                      child: const SignUpScreen(),
                    ),
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
