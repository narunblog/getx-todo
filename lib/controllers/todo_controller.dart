import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_getx/models/todo.dart';

class TodoController extends GetxController {
  RxList<Todo> todos = <Todo>[].obs;

  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('todos');
    if (storedTodos != null) {
      todos = storedTodos.map((todo) => Todo.fromJson(todo)).toList().obs;
    }
    ever(todos, (_) {
      GetStorage().write('todos', todos.toList());
    });
    super.onInit();
  }
}
