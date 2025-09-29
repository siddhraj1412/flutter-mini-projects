import 'package:flutter/material.dart';

class Task {
  String text;
  String category;
  bool completed;

  Task({required this.text, required this.category, this.completed = false});
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Task> tasks = [];
  final TextEditingController _taskController = TextEditingController();
  String selectedCategory = 'Personal';
  bool showCompletedOnly = false;

  final List<String> categories = ['Personal', 'Work', 'Shopping'];

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        tasks.add(Task(text: _taskController.text, category: selectedCategory));
        _taskController.clear();
      });
    }
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _toggleCompleted(int index) {
    setState(() {
      tasks[index].completed = !tasks[index].completed;
    });
  }

  List<Task> get filteredTasks {
    if (showCompletedOnly) {
      return tasks.where((task) => task.completed).toList();
    }
    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          Switch(
            value: showCompletedOnly,
            onChanged: (value) {
              setState(() {
                showCompletedOnly = value;
              });
            },
            activeColor: Colors.green,
          ),
          Text(showCompletedOnly ? 'Completed' : 'All'),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(labelText: 'Enter task'),
                  ),
                ),
                SizedBox(width: 8),
                DropdownButton<String>(
                  value: selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                  items: categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                ),
                SizedBox(width: 8),
                ElevatedButton(onPressed: _addTask, child: Text('Add')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                final task = filteredTasks[index];
                return ListTile(
                  title: Text(task.text),
                  subtitle: Text('Category: ${task.category}'),
                  leading: Checkbox(
                    value: task.completed,
                    onChanged: (value) {
                      _toggleCompleted(tasks.indexOf(task));
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteTask(tasks.indexOf(task));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
