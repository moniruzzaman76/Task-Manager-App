import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import '../../widgets/background_images.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email, otp;
  const ResetPasswordScreen({Key? key, required this.email, required this.otp}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final TextEditingController _passwordEditingController = TextEditingController();
  final TextEditingController _confirmPasswordEditingController = TextEditingController();

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
                      const SizedBox(height: 100,),
                      Text("Set Password",
                        style: Theme.of(context).textTheme.titleLarge,),

                      const SizedBox(height:6,),

                      Text("A 6 digit verification pin will sent on your email address",
                        style: Theme.of(context).textTheme.bodyMedium,),

                      const SizedBox(height: 16,),

                      TextFormField(
                        controller: _passwordEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "password",
                          prefixIcon: Icon(Icons.lock_clock_outlined),
                        ),
                      ),

                      const SizedBox(height: 16,),

                      TextFormField(
                        controller: _confirmPasswordEditingController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Confirm password",
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),

                      const SizedBox(height: 20,),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>const LoginScreen()));
                            },
                            child: const Text("Confirm")
                        ),
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

                          TextButton(onPressed: (){
                            Navigator.pop(context);
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
        )
    );
  }
}

