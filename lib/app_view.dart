import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/create_task_bloc/create_task_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/get_tasks_bloc/get_tasks_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/update_task_bloc%20/update_task_bloc.dart';
import 'package:flutter_todo_app_r5/screens/screens.dart';
import 'package:task_repository/task_repository.dart';

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
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => SignInBloc(
                      userRepository: context.read<AuthenticationBloc>().userRepository),
                  ),

                  BlocProvider(
                    create: (context) => MyUserBloc(
                      myUserRepository: context.read<AuthenticationBloc>().userRepository
                    )..add(GetMyUser(myUserId: context.read<AuthenticationBloc>().state.user!.uid)),
                  ),

                  BlocProvider(
                    create: (context) => GetTasksBloc(
                      taskRepository: FirebaseTaskRepository()
                    )..add(GetTasks(myUserId: state.user!.uid))
                  ),
                  BlocProvider(
                    create: (context) => CreateTaskBloc(
                        taskRepository: FirebaseTaskRepository()),
                  ),
                  BlocProvider(
                    create: (context) => UpdateTaskBloc(
                      taskRepository: FirebaseTaskRepository()),
                  ),
                ],
                child: const HomeTaskScreen(),
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
