import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo.dart';

class EditTodo extends StatelessWidget {
  final int index;
  EditTodo({Key? key, required this.index}) : super(key: key);

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
        TextEditingController(text: todoController.todos[index].title);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Waht do you want to accomplish ?',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                autofocus: true,
                style: TextStyle(
                  fontSize: 25,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (() {
                    Get.back();
                  }),
                  child: Text('cancel'),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
                ElevatedButton(
                  onPressed: (() {
                    var editing = todoController.todos[index];
                    editing.title = textEditingController.text;
                    todoController.todos[index] = editing;
                    Get.back();
                  }),
                  child: Text('update'),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
