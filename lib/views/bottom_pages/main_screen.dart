import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/todos_model.dart';
import 'package:flutter_application_2/services/todos_service.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  List<Welcome> todos = [];
  bool isLoading = true;

  getTodosData() async {
    todos = await TodosServices().getTodosData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    isLoading = false;
    getTodosData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading? Center( child:CircularProgressIndicator(),
    )
      :ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(todos[index].id.toString()),
            title: Text(todos[index].title ?? "--"),
             subtitle: Text(todos[index].completed.toString()),
             trailing: Icon(Icons.adjust),
          );
        });
  }
}
