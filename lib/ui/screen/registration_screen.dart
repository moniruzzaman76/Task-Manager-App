import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import '../../widgets/background_images.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();
  final TextEditingController _firstNameEditingController = TextEditingController();
  final TextEditingController _lastNameEditingController = TextEditingController();
  final TextEditingController _mobileEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackGround(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    Text("Get Started with",
                      style: Theme.of(context).textTheme.titleLarge,),

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
                        prefixIcon: Icon(Icons.person_2_outlined),
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
                                MaterialPageRoute(builder: (context)=>const LoginScreen()));
                          },
                          child: const Icon(Icons.arrow_circle_right_outlined,size: 30,)
                      ),
                    ),

                    const SizedBox(height: 16,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have account?",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5
                        ),),

                        TextButton(onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>const LoginScreen()));
                        },
                          child: const Text("Sing In",style: TextStyle(
                            fontSize: 18,
                          ),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}




