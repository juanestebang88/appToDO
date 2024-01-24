import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app_r5/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_todo_app_r5/components/components.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKeySignIn = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late bool signInRequired = false;
  bool _isValidForm = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess){
          setState(() {
            signInRequired = false;
          });
        }else if (state is SignInProcess) {
          setState(() {
            signInRequired = true;
          });
        }else if (state is SignInFailure) {
          setState(() {
            signInRequired = false;
          });
          AlertCustom.simple(context: context, text:  'Email o Contraseña invalidos');
        }
      },
      child: Form(
        key: _formKeySignIn,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: TextLabel.textNormal(text: 'Ingresa tus datos'),
            ),
            TextFormFieldCustom(
              controller: emailController,
              hintText: 'Correo',
              icon: Icons.email,
              inputType: TextInputType.emailAddress,
              validator: (value) => ValidationsForm.email(value.toString()),
              onChanged: (value) {
                setState(() => _isValidForm =
                    _formKeySignIn.currentState?.validate() == true);
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
                    _formKeySignIn.currentState?.validate() == true);
              }),
            !signInRequired
            ? ButtonCustom(
                text: 'Ingresar',
                currentStateValidate: _isValidForm,
                function: !_isValidForm
                    ? null
                    : () {
                        context.read<SignInBloc>().add(SignInRequired(
                          emailController.text,
                          passwordController.text));
                    },
              )
            : const ProcessIndicatorCustom()
          ],
        )
      ),
    );
  }
}