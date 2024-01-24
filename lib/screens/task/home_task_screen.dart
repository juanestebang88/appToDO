import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_todo_app_r5/components/components.dart';
import 'package:flutter_todo_app_r5/screens/screens.dart';

class HomeTaskScreen extends StatefulWidget {
  const HomeTaskScreen({super.key});

  @override
  State<HomeTaskScreen> createState() => _HomeTaskScreenState();
}

class _HomeTaskScreenState extends State<HomeTaskScreen> {
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
                    builder: (context) => CreateTaskScreen(
                      state.user!),
                  ));
              },
              child: const Icon(Icons.add),
            );
          }else{
            return const FloatingActionButton(
              backgroundColor: Colors.grey,
              onPressed: null,
              child: Icon(Icons.clear),
            );
          }
        },
      ),
      appBar: AppBar(
        title:
            TextLabel.textNormal(text: 'Tareas de text', color: Colors.white),
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
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, int i) {
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
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextLabel.textPurpleBold(
                                  text: 'tilestilestilestilestilestilesti',
                                  size: 16),
                              const SizedBox(height: 8.0),
                              TextLabel.textNormal(text: 'tiles', size: 16.0)
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextLabel.textNormal(
                                text: '13/13/2024',
                                color: Colors.black26,
                                size: 14.0),
                            const SizedBox(height: 8.0),
                            TextLabel.textBold(
                              text: '${false ? 'Completada' : 'Pendiente'}',
                              size: 16.0,
                              color: false ? Colors.green : Colors.deepOrange,
                            ),
                            ButtonCardFinish()
                          ],
                        ),
                      ],
                    ),

                    // Container(
                    //   color: Colors.blue,
                    //   child: Column(
                    //     children: [
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.end,
                    //         children: [
                    //           Column(
                    //             children: [
                    //               TextLabel.textBold(
                    //                 text: '${false ? 'Completada' : 'Pendiente'}',
                    //                 size: 14.0,
                    //                 color: false ? Colors.green : Colors.redAccent,
                    //               ),
                    //               Row(
                    //                 mainAxisAlignment: MainAxisAlignment.end,
                    //                 children: [
                    //                   ButtonCardFinish(),
                    //                 ],
                    //               )
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
