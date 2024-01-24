import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/create_task_bloc/create_task_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/get_tasks_bloc/get_tasks_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_todo_app_r5/components/components.dart';
import 'package:task_repository/task_repository.dart';
import 'package:user_repository/user_repository.dart';

class CreateTaskScreen extends StatefulWidget {
  final MyUserModel myUserModel;
  const CreateTaskScreen(this.myUserModel, {super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  late MyTaskModel myTaskModel;
  final _formKeyTask = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late bool postTaskRequired = false;
  bool _isValidForm = false;

  @override
  void initState() {
    myTaskModel = MyTaskModel.empty;
    myTaskModel.userId = widget.myUserModel.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextLabel.textNormal(
            text: 'Crea una nueva tarea', color: Colors.white),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: BlocListener<CreateTaskBloc, CreateTaskState>(
            listener: (context, state) {
              if (state is CreateTaskSuccess) {
                setState(() {
                  postTaskRequired = false;
                });
                Navigator.pop(context);
              } else if (state is CreateTaskLoading) {
                setState(() {
                  postTaskRequired = true;
                });
              } else if (state is CreateTaskFailure) {
                setState(() {
                  postTaskRequired = false;
                });
                AlertCustom.simple(
                    context: context,
                    text: 'Hubo un problema, intentalo de nuevo');
              }
            },
            child: Form(
                key: _formKeyTask,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: TextLabel.textNormal(
                          text: 'Ingresa los datos\nde tu nueva tarea'),
                    ),
                    TextFormFieldCustom(
                        controller: titleController,
                        hintText: 'Nombre de la Tarea',
                        icon: Icons.title,
                        validator: (value) =>
                            ValidationsForm.nameAndDescriptionTask(
                                value.toString()),
                        onChanged: (value) {
                          setState(() => _isValidForm =
                              _formKeyTask.currentState?.validate() == true);
                        }),
                    TextFormFieldCustom(
                        controller: descriptionController,
                        hintText: 'Descripción',
                        icon: Icons.description,
                        maxLines: 5,
                        validator: (value) =>
                            ValidationsForm.nameAndDescriptionTask(
                                value.toString()),
                        onChanged: (value) {
                          setState(() => _isValidForm =
                              _formKeyTask.currentState?.validate() == true);
                        }),
                    !postTaskRequired
                        ? ButtonCustom(
                          text: 'Crear',
                          currentStateValidate: _isValidForm,
                          function: !_isValidForm
                              ? null
                              : () {
                                  setState(() {
                                    myTaskModel.nameTask =
                                        titleController.text;
                                    myTaskModel.descriptionTask =
                                        descriptionController.text;
                                  });
                                  context
                                      .read<CreateTaskBloc>()
                                      .add(CreateTask(myTaskModel));
                                  
                                },
                        )
                        : const ProcessIndicatorCustom()
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
