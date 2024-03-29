import 'package:flutter/material.dart';
import 'package:task_manager/data/service/network_coller.dart';
import '../../data/Utils/urls.dart';
import '../../data/model/task_list_model.dart';
import '../../data/service/network_response.dart';

class UpdateTaskStatusSheet extends StatefulWidget {
  final TaskData task;
  final VoidCallback onUpdate;

  const UpdateTaskStatusSheet(
      {Key? key, required this.task, required this.onUpdate})
      : super(key: key);

  @override
  State<UpdateTaskStatusSheet> createState() => _UpdateTaskStatusSheetState();
}

class _UpdateTaskStatusSheetState extends State<UpdateTaskStatusSheet> {
  List<String> taskStatusList = ['New', 'Completed', 'Cancelled', 'Progress'];
  late String _selectedTask;
  bool updateTaskInProgress = false;

  @override
  void initState() {
    _selectedTask = widget.task.status!.toLowerCase();
    super.initState();
  }

  Future<void> updateTask(String taskId, String newStatus) async {
    updateTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
    await NetWorkCaller().getRequest(Urls.updateTask(taskId, newStatus));
    updateTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      widget.onUpdate();
      if (mounted) {
        Navigator.pop(context);
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Update task status has been failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.all(16), child: Text('Update Status',style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.green
          ),)),
          Expanded(
            child: ListView.builder(
                itemCount: taskStatusList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      _selectedTask = taskStatusList[index];
                      setState(() {});
                    },
                    title: Text(taskStatusList[index].toUpperCase()),
                    trailing: _selectedTask == taskStatusList[index]
                        ? const Icon(Icons.check)
                        : null,
                  );
                }),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Visibility(
                  visible: updateTaskInProgress == false,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          updateTask(widget.task.sId!, _selectedTask);
                        },
                        child: const Text('Update',style: TextStyle(
                          fontSize: 20,
                        ),)),
                  )))
        ],
      ),
    );
  }
}