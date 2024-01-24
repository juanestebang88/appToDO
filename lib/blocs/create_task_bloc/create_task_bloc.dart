import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_repository/task_repository.dart';

part 'create_task_event.dart';
part 'create_task_state.dart';

class CreateTaskBloc extends Bloc<CreateTaskEvent, CreateTaskState> {
  TaskRepository _taskRepository;

  CreateTaskBloc({
    required TaskRepository taskRepository
  }) : _taskRepository = taskRepository,
    super(CreateTaskInitial()) {
    on<CreateTask>((event, emit) async{
        emit(CreateTaskLoading());
      try {
        MyTaskModel myTaskModel= await _taskRepository.createTask(event.myTaskModel);
        emit(CreateTaskSuccess(myTaskModel));
      } catch (e) {
        emit(CreateTaskFailure());
      }
    });
  }
}
