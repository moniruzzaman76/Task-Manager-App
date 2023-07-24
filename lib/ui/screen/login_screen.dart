import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/email_verification_screen.dart';
import '../../widgets/background_images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();

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

                    const SizedBox(height: 30,),

                    TextFormField(
                      controller: _emailEditingController,
                     keyboardType: TextInputType.emailAddress,
                     decoration: const InputDecoration(
                       hintText: "Enter your email",
                       prefixIcon: Icon(Icons.email_outlined),
                     ),
                    ),

                    const SizedBox(height: 20,),

                    TextFormField(
                      controller: _passwordEditingController,
                      decoration: const InputDecoration(
                        hintText: "Enter your password",
                        prefixIcon: Icon(Icons.lock_clock_outlined),
                      ),
                    ),

                    const SizedBox(height: 20,),

                    SizedBox(
                       width: double.infinity,
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>const EmailVerificationScreen()));
                          },
                          child: const Icon(Icons.arrow_circle_right_outlined,size: 30,)
                      ),
                    ),

                    const SizedBox(height: 20,),

                    TextButton(
                      onPressed: (){

                      },
                      child: const Text("Forgot Password ?",style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                    ),),
                    ),

                    const SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                             const Text("Don't have account?",style: TextStyle(
                              fontSize: 18,
                             fontWeight: FontWeight.w500,
                               letterSpacing: 0.5
                            ),),

                        TextButton(onPressed: (){},
                            child: const Text("Sing up",style: TextStyle(
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




