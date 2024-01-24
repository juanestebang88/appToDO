import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    myTaskModel.myUserModel = widget.myUserModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextLabel.textNormal(text: 'Crea una nueva tarea', color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _formKeyTask,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: TextLabel.textNormal(text: 'Ingresa los datos\nde tu nueva tarea'),
                ),
                TextFormFieldCustom(
                  controller: titleController,
                  hintText: 'Nombre de la Tarea',
                  icon: Icons.title,
                  validator: (value) => ValidationsForm.nameAndDescriptionTask(value.toString()),
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
                      ValidationsForm.nameAndDescriptionTask(value.toString()),
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
                            // MyTaskModel myTaskModel = MyTaskModel(
                            //   taskId: taskId,
                            //   nameTask: nameTask,
                            //   createDate: createDate,
                            //   myUserModel: myUserModel,
                            //   stateTask: stateTask
                            // )
                        },
                                          )
                : const ProcessIndicatorCustom()
              ],
            )
          ),
        ),
      ),
    );
  }
}