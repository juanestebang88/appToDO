import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_repository/task_repository.dart';

part 'get_tasks_event.dart';
part 'get_tasks_state.dart';

class GetTasksBloc extends Bloc<GetTasksEvent, GetTasksState> {
  TaskRepository _taskRepository;

  GetTasksBloc({
    required TaskRepository taskRepository
  }) : _taskRepository = taskRepository,
    super(GetTasksInitial()) {
    on<GetTasks>((event, emit) async{
        emit(GetTasksLoading());
      try {
        List<MyTaskModel> tasks = await _taskRepository.getTask();
        emit(GetTasksSucces(tasks));
      } catch (e) {
        emit(GetTasksFailure());
      }
    });
  }
}
