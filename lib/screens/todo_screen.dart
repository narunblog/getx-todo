import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';

import '../models/todo.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});
  TextEditingController textEditingController = TextEditingController();
  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
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
                    todoController.todos
                        .add(Todo(title: textEditingController.text));

                    Get.back();
                  }),
                  child: Text('add'),
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
