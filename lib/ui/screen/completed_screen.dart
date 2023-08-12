import 'package:flutter/material.dart';
import 'package:task_manager/data/model/task_list_model.dart';
import 'package:task_manager/ui/screen/update_profile_screen.dart';
import 'package:task_manager/ui/screen/update_task_status_sheet.dart';
import '../../data/Utils/urls.dart';
import '../../data/service/network_coller.dart';
import '../../data/service/network_response.dart';
import '../../widgets/list_tile_task.dart';
import '../../widgets/user_profile_banar.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) { 
      getCompletedTaskList();
    });
  }
  
  bool _completedTaskInProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  Future<void>getCompletedTaskList()async{

    _completedTaskInProgress = true;
    if(mounted){
      setState(() {});

      final NetworkResponse response = await NetWorkCaller().getRequest(Urls.completedTaskList);

      _completedTaskInProgress = false;
      if(mounted){
        setState(() {});
      }
      if(response.isSuccess){
        _taskListModel = TaskListModel.fromJson(response.body!);
      }else{
        if(mounted){
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                  content: Text("completed Task get failed!")));
        }
      }
    }
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

  
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>const UpdateProfileScreen()));
              },
                child: const UserProfileBanner()
            ),

            Expanded(
                child: RefreshIndicator(
                  onRefresh: ()async{
                    await getCompletedTaskList();
                  },
                  child: Visibility(
                    visible: !_completedTaskInProgress,
                    replacement: const Center(child: CircularProgressIndicator()),
                    child: ListView.separated(
                      itemCount: _taskListModel.data?.length ?? 0,
                      itemBuilder: (context,index){
                        return  ListTileTask(
                          onDeleteTap: (){
                            _showDeleteDialog(index);
                          },
                          onEditTap: (){
                            showStatusUpdateBottomSheet(_taskListModel.data![index]);
                          },
                          data: _taskListModel.data![index],
                          color: Colors.green,);
                      },
                      separatorBuilder: (context,index){
                        return const Divider(
                          height: 4,
                          thickness: 1,
                        );
                      },

                    ),
                  ),
                )
            )
          ],
        ),
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
                    getCompletedTaskList();
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


  void showStatusUpdateBottomSheet(TaskData task) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return UpdateTaskStatusSheet(task: task, onUpdate: () {
          getCompletedTaskList();
        });
      },
    );
  }


}
