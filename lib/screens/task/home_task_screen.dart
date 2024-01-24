import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/create_task_bloc/create_task_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/get_tasks_bloc/get_tasks_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/update_task_bloc%20/update_task_bloc.dart';
import 'package:flutter_todo_app_r5/components/components.dart';
import 'package:flutter_todo_app_r5/screens/screens.dart';
import 'package:task_repository/task_repository.dart';

class HomeTaskScreen extends StatefulWidget {
  const HomeTaskScreen({super.key});

  @override
  State<HomeTaskScreen> createState() => _HomeTaskScreenState();
}

class _HomeTaskScreenState extends State<HomeTaskScreen> {
  late String title;
  late String description;
  late String date;
  late bool stateTask;
  late bool isSpanish = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<MyUserBloc, MyUserState>(
        builder: (context, state) {
          if (state.status == MyUserStatus.success) {
            return FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiBlocProvider(
                        providers: [
                          BlocProvider<CreateTaskBloc>(
                            create: (context) => CreateTaskBloc(
                                taskRepository: FirebaseTaskRepository()),
                          ),
                          BlocProvider(
                              create: (context) => GetTasksBloc(
                                  taskRepository: FirebaseTaskRepository())
                                ..add(GetTasks(myUserId: state.user!.id))),
                        ],
                        child: CreateTaskScreen(state.user!),
                      ),
                    )).then((value) => context.read<GetTasksBloc>().add(GetTasks(myUserId: state.user!.id)));
              },
              child: const Icon(Icons.add),
            );
          } else {
            return const FloatingActionButton(
              backgroundColor: Colors.grey,
              onPressed: null,
              child: Icon(Icons.clear),
            );
          }
        },
      ),
      appBar: AppBar(
        title: TextLabel.textNormal(text: 'Tareas', color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {
                AlertCustom.yesOrNot(
                    context: context,
                    text: '¿Está seguro que desea salir de la aplicación?',
                    functionYes: () {
                      context.read<SignInBloc>().add(const SignOutRequired());
                      Navigator.of(context).pop();
                    });
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: BlocBuilder<GetTasksBloc, GetTasksState>(
        builder: (context, state) {
          if (state is GetTasksSucces) {
            if (state.tasks.length.toInt() == 0) {
              return Center(child: TextLabel.textPurpleBold(text: 'No tienes tareas'));
            }else{
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.tasks.length,
                  itemBuilder: (context, int i) {
                    title = state.tasks[i].nameTask;
                    description = state.tasks[i].descriptionTask;
                    date = FormatDate.simple(state.tasks[i].createDate);
                    stateTask = state.tasks[i].stateTask;

                    return Card(
                      elevation: 2.0,
                      margin: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.65,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextLabel.textPurpleBold(
                                          text: title, size: 16),
                                      const SizedBox(height: 8.0),
                                      TextLabel.textNormal(
                                          text: description, size: 16.0),
                                      const SizedBox(height: 8.0),
                                      ButtonTraslate(onTap: () async {
                                        Map<String, String> translate =
                                            await Translator.translateText(
                                                name: state.tasks[i].nameTask,
                                                description: state
                                                    .tasks[i].descriptionTask,
                                                isSpanish: isSpanish);
                                        setState(() {
                                          state.tasks[i].nameTask =
                                              translate['nameTrasn'].toString();
                                          state.tasks[i].descriptionTask =
                                              translate['descriptionTrasn']
                                                  .toString();
                                          isSpanish = !isSpanish;
                                        });
                                      })
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextLabel.textNormal(
                                        text: date,
                                        color: Colors.black26,
                                        size: 14.0),
                                    const SizedBox(height: 8.0),
                                    TextLabel.textBold(
                                      text: stateTask
                                          ? 'Completada'
                                          : 'Pendiente',
                                      size: 16.0,
                                      color: stateTask
                                          ? Colors.green
                                          : Colors.deepOrange,
                                    ),
                                    !stateTask
                                        ? ButtonCardFinish(
                                            onTap: () {
                                              context
                                              .read<UpdateTaskBloc>()
                                              .add(UpdateTask(state.tasks[i]));

                                              context
                                              .read<GetTasksBloc>()
                                              .add(GetTasks(myUserId: state.tasks[i].userId));
                                            },
                                          )
                                        : const SizedBox.shrink()
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          } else if (state is GetTasksLoading) {
            return const Center(child: ProcessIndicatorCustom());
          } else {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: TextLabel.textPurpleBold(text: 'Hubo un error'),
              ),
            );
          }
        },
      ),
    );
  }
}
