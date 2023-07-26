import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/bottom_nab_bar_screen.dart';
import '../../widgets/user_profile_banar.dart';

class CreateNewTaskScreen extends StatefulWidget {
  const CreateNewTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewTaskScreen> createState() => _CreateNewTaskScreenState();
}

class _CreateNewTaskScreenState extends State<CreateNewTaskScreen> {

  final TextEditingController _subjectEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
               InkWell(
                 onTap:(){} ,
                   child: const UserProfileBanner(),
               ),
              const SizedBox(height: 60),
              Text("Add New Task",
                style: Theme.of(context).textTheme.titleLarge,),

              const SizedBox(height: 30,),

              TextFormField(
                controller: _subjectEditingController,
                decoration: const InputDecoration(
                  hintText: "Enter your Subject",
                  prefixIcon: Icon(Icons.title_outlined),
                ),
              ),

              const SizedBox(height: 20,),

              TextFormField(
                controller: _descriptionEditingController,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: "Description",
                  prefixIcon: Icon(Icons.description_outlined),
                ),
              ),

              const SizedBox(height: 20,),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context)=>const BottomNabBarScreen()));
                    },
                    child: const Icon(Icons.arrow_circle_right_outlined,size: 30,)
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
