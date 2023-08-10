import 'package:flutter/material.dart';
import 'package:task_manager/data/model/task_list_model.dart';
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
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),

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
                          onDeleteTap: (){},
                          onEditTap: (){},
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
}
