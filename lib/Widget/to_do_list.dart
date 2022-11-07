import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';

import '../Model/todo.dart';

class ToDoView extends StatefulWidget {
   ToDoView({Key? key}) : super(key: key);

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  final toDosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToolkitColors.greyLight,
      body: ListView(
        children: [
          for(ToDo todo in toDosList)
          ToDoItems(todo: todo,onToDoChanged: _handleTodoChange,onToDoDelete: _deleteTodoChange,),

        ],
      ),
    );
  }
  void _handleTodoChange (ToDo toDo){
    setState((){
      toDo.isDone = !toDo.isDone;
    });
  }void _deleteTodoChange (String  id){
    setState((){
      toDosList.removeWhere((item) => item.id == id);
    });
  }
}


class ToDoItems extends StatelessWidget {
   ToDoItems({Key? key,required this.todo,required this.onToDoChanged,required this.onToDoDelete}) : super(key: key);
final ToDo todo;
final  onToDoChanged;
final  onToDoDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        tileColor: ToolkitColors.white,
        leading: Icon(todo.isDone?
          Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.purple,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: todo.isDone? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.red,
          ),
          child: IconButton(
              onPressed: () {
                onToDoDelete(todo.id);
              },
              icon: Icon(
                Icons.delete,
                size: 18,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
