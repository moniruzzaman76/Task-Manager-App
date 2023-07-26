import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/bottom_nab_bar_screen.dart';

import '../../widgets/background_images.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();
  final TextEditingController _firstNameEditingController = TextEditingController();
  final TextEditingController _lastNameEditingController = TextEditingController();
  final TextEditingController _mobileEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: ScreenBackGround(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    Text("Update Profile",
                      style: Theme.of(context).textTheme.titleLarge,),

                    const SizedBox(height: 20,),

                    Row(
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            alignment: Alignment.center,
                          padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                topLeft:Radius.circular(7), bottomLeft: Radius.circular(7),
                              )
                            ),

                            child: const Text("Photo",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),),
                          ),
                        ),
                        Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(15),
                             decoration: const BoxDecoration(
                               color: Colors.white,
                                 borderRadius: BorderRadius.only(
                                   topLeft:Radius.circular(7), bottomLeft: Radius.circular(7),
                                 )
                             ),
                              child: const Text("image url",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                color: Colors.black54,
                              ),),
                            )
                        )
                      ],
                    ),

                    const SizedBox(height: 20,),

                    TextFormField(
                      controller: _emailEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Enter your email",
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),

                    const SizedBox(height: 16,),

                    TextFormField(
                      controller: _firstNameEditingController,
                      decoration: const InputDecoration(
                        hintText: "Enter your firs Name",
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),

                    const SizedBox(height: 16,),

                    TextFormField(
                      controller: _lastNameEditingController,
                      decoration: const InputDecoration(
                        hintText: "Enter your last name",
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),

                    const SizedBox(height: 16,),

                    TextFormField(
                      controller: _mobileEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: "Enter your Mobile",
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),

                    const SizedBox(height: 16,),

                    TextFormField(
                      controller: _passwordEditingController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter your password",
                        prefixIcon: Icon(Icons.lock_clock_outlined),
                      ),
                    ),

                    const SizedBox(height: 16,),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>const BottomNabBarScreen()));
                          },
                          child: const Icon(Icons.arrow_circle_right_outlined,size: 30,)
                      ),
                    ),


                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
