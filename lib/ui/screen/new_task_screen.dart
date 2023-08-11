import 'package:flutter/material.dart';
import 'package:task_manager/data/Utils/urls.dart';
import 'package:task_manager/data/model/task_list_model.dart';
import 'package:task_manager/data/model/summery_count_model.dart';
import 'package:task_manager/data/service/network_coller.dart';
import 'package:task_manager/data/service/network_response.dart';
import 'package:task_manager/ui/screen/create_task_Screen.dart';
import 'package:task_manager/ui/screen/update_profile_screen.dart';
import '../../widgets/list_tile_task.dart';
import '../../widgets/summery_card.dart';
import '../../widgets/user_profile_banar.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  SummeryCountModel _summeryCountModel = SummeryCountModel();
  TaskListModel _taskListModel = TaskListModel();

  bool _summeryCountInProgress = false, _addNewTaskInProgress = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getSummeryCount();
      getNewTaskList();
    });
  }

  Future<void> deleteTask(taskId) async {
    final NetworkResponse response =
        await NetWorkCaller().getRequest(Urls.deleteTask(taskId));
    if (response.isSuccess) {

       _taskListModel.data?.removeWhere((element) => element.sId == taskId);
      // getNewTaskList();
      // getSummeryCount();
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red, content: Text("Task delete failed!")));
      }
    }
  }

  Future<void> getSummeryCount() async {
    _summeryCountInProgress = true;
    if (mounted) {
      setState(() {});
    }

    final NetworkResponse response =
        await NetWorkCaller().getRequest(Urls.taskStatusCount);
    _summeryCountInProgress = false;
    if (mounted) {
      setState(() {});
    }

    if (response.isSuccess) {
      _summeryCountModel = SummeryCountModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("summery data get failed!")));
      }
    }
  }

  Future<void> getNewTaskList() async {
    _addNewTaskInProgress = true;
    if (mounted) {
      setState(() {});

      final NetworkResponse response =
          await NetWorkCaller().getRequest(Urls.newTaskList);

      _addNewTaskInProgress = false;
      if (mounted) {
        setState(() {});
      }
      if (response.isSuccess) {
        _taskListModel = TaskListModel.fromJson(response.body!);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.red,
              content: Text("New Task data failed!")));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateProfileScreen()));
              },
              child: const UserProfileBanner(),
            ),

            //  Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: _summeryCountInProgress ? const LinearProgressIndicator() :
            //   const Row(
            //     children: [
            //       SummeryCard(
            //         count: '5',
            //         title: "New Task",
            //       ),
            //       SummeryCard(
            //         count: '4',
            //         title: "In Progress",
            //       ),
            //       SummeryCard(
            //         count: '4',
            //         title: "Completed",
            //       ),
            //       SummeryCard(
            //         count: '3',
            //         title: "Cancel",
            //       ),
            //     ],
            //   ),
            // ),

            Visibility(
              visible: !_summeryCountInProgress,
              replacement: const LinearProgressIndicator(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _summeryCountModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return SummeryCard(
                        count: _summeryCountModel.data![index].sum.toString(),
                        title: _summeryCountModel.data![index].sId ?? "New",
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 4,
                        thickness: 1,
                      );
                    },
                  ),
                ),
              ),
            ),

            Expanded(
                child: RefreshIndicator(
              color: Colors.red,
              backgroundColor: Colors.white70,
              onRefresh: () async {
                getNewTaskList();
                getSummeryCount();
              },
              child: Visibility(
                visible: _addNewTaskInProgress == false,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: ListView.separated(
                  itemCount: _taskListModel.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTileTask(
                      data: _taskListModel.data![index],
                      onDeleteTap: () {
                        _showDeleteDialog(index);
                        // deleteTask(_newTaskListModel.data![index].sId);
                      },
                      onEditTap: () {},
                      color: Colors.green,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 4,
                      thickness: 1,
                    );
                  },
                ),
              ),
            ))

            // const ListTileTask(text:"New",color: Colors.blue,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateNewTaskScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDeleteDialog(index){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Center(
            child: Text("Delete!",style: TextStyle(color:Colors.red),)),
        content: const Text("Do you want to delete task?",style:TextStyle(
          fontSize: 22,
        ),),
        actions: [
          Row(
            children: [
              TextButton(
                  onPressed: (){
                    getNewTaskList();
                    deleteTask(_taskListModel.data![index].sId);
                    Navigator.pop(context);
                    if(mounted){
                      setState(() {});
                    }
              }, child: const Text("Yes",style: TextStyle(
                fontSize: 20,
                color: Colors.red
              ),)),
              const Spacer(),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text("NO",style: TextStyle(
                  fontSize: 20,
              ),)),

            ],
          )
        ],
      );
    });
  }
}
