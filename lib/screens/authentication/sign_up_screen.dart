import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/sign_up/sign_up_bloc.dart';
import 'package:flutter_todo_app_r5/components/components.dart';
import 'package:user_repository/user_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKeySignUp = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  late bool _signUpRequired = false;
  bool _isValidForm = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpProcess) {
          setState(()=> _signUpRequired = true);
        }
        if (state is SignUpSuccess) {
          setState(()=> _signUpRequired = false);
        }
        if (state is SignUpFailure) {
          setState(()=> _signUpRequired = false);
          AlertCustom.simple(context: context, text: 'En este momento no es posible registrarte');
        }
      },
      child: Form(
          key: _formKeySignUp,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child:
                    TextLabel.textNormal(text: 'Registrate \nIngresando tus datos'),
              ),
              TextFormFieldCustom(
                  controller: nameController,
                  hintText: 'Nombre',
                  icon: Icons.person,
                  inputType: TextInputType.text,
                  validator: (value) => ValidationsForm.name(value.toString()),
                  onChanged: (value) {
                    setState(() => _isValidForm =
                        _formKeySignUp.currentState?.validate() == true);
                  }),
              TextFormFieldCustom(
                  controller: emailController,
                  hintText: 'Correo',
                  icon: Icons.email,
                  inputType: TextInputType.emailAddress,
                  validator: (value) => ValidationsForm.email(value.toString()),
                  onChanged: (value) {
                    setState(() => _isValidForm =
                        _formKeySignUp.currentState?.validate() == true);
                  }),
              TextFormFieldCustom(
                  controller: passwordController,
                  hintText: 'Contraseña',
                  icon: Icons.key,
                  inputType: TextInputType.number,
                  obscure: true,
                  validator: (value) =>
                      ValidationsForm.password(value.toString()),
                  onChanged: (value) {
                    setState(() => _isValidForm =
                        _formKeySignUp.currentState?.validate() == true);
                  }),
              TextFormFieldCustom(
                  controller: passwordConfirmController,
                  hintText: 'Confima contraseña',
                  icon: Icons.key_outlined,
                  inputType: TextInputType.number,
                  obscure: true,
                  validator: (value) => ValidationsForm.passwordConfirm(
                      passwordController.text, value.toString()),
                  onChanged: (value) {
                    setState(() => _isValidForm =
                        _formKeySignUp.currentState?.validate() == true);
                  }),
              !_signUpRequired
              ? ButtonCustom(
                  text: 'Registrar',
                  currentStateValidate: _isValidForm,
                  function: 
                  !_isValidForm
                  ? null
                  : () {
                    if (_isValidForm) {
                      MyUserModel myUser = MyUserModel.empty;
                      myUser = myUser.copyWith(
                          name: nameController.text,
                          email: emailController.text);
                      setState(() {
                        context.read<SignUpBloc>().add(SignUpRequired(
                          myUser, 
                          passwordConfirmController.text)
                        );
                      });
                    }
                  },
                )
              :  const ProcessIndicatorCustom() 
            ],
          )),
    );
  }
}
