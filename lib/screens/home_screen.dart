import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/screens/edit_todo_screen.dart';
import 'package:todo_getx/screens/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TodoScreen());
        },
      ),
      body: Container(
        child: Obx(() {
          return ListView.separated(
              itemBuilder: (context, index) => Dismissible(
                    background: Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.red,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    key: UniqueKey(),
                    onDismissed: (_) {
                      todoController.todos.removeAt(index);
                      Get.snackbar('remove', 'task was deleted !');
                    },
                    child: ListTile(
                      title: Text(todoController.todos[index].title,
                          style: todoController.todos[index].done
                              ? TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough)
                              : TextStyle(
                                  color: Colors.black,
                                )),
                      onTap: () {},
                      leading: Checkbox(
                          value: todoController.todos[index].done,
                          onChanged: (newValue) {
                            var todo = todoController.todos[index];
                            todo.done = newValue!;
                            todoController.todos[index] = todo;
                          }),
                      trailing: InkWell(
                        child: Icon(Icons.edit),
                        onTap: () {
                          Get.to(EditTodo(index: index));
                        },
                      ),
                    ),
                  ),
              separatorBuilder: (context, pos) => Divider(),
              itemCount: todoController.todos.length);
        }),
      ),
    );
  }
}
