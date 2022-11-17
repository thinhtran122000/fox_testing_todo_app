import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_testing_todo_app/home_page/bloc/home_page_bloc.dart';
import 'package:fox_testing_todo_app/models/todo_model.dart';

class NewTodoPage extends StatefulWidget {
  const NewTodoPage({super.key});

  @override
  State<NewTodoPage> createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Todo'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const SizedBox(
            height: 16.97,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.multiline,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.left,
              controller: textEditingController,
              cursorHeight: 22,
              cursorColor: Colors.grey,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 10),
                hintText: 'Title',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
            BlocListener<HomePageBloc, HomePageState>(
              listener: (context, state) {
                if (state is TodosLoaded) {}
              },
              child: ElevatedButton(
                onPressed: () {
                  Todo todo = Todo(id: '1', title: textEditingController.text);
                  context.read<HomePageBloc>().add(AddTodo(todo: todo));
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
