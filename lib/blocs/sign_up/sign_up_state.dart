part of 'sign_up_bloc.dart';

abstract class SignUpState{
  const SignUpState();

  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}
class SignUpSuccess extends SignUpState {}
class SignUpFailure extends SignUpState {}
class SignUpProcess extends SignUpState {}

