part of 'update_task_bloc.dart';

sealed class UpdateTaskState extends Equatable {
  const UpdateTaskState();
  
  @override
  List<Object> get props => [];
}

final class UpdateTaskInitial extends UpdateTaskState {}

final class UpdateTaskFailure extends UpdateTaskState {}

final class UpdateTaskLoading extends UpdateTaskState {}

final class UpdateTaskSuccess extends UpdateTaskState {}

