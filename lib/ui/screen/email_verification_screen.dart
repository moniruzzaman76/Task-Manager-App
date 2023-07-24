import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/background_images.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  final TextEditingController _emailEditingController = TextEditingController();

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
                    Text("Your Email Address",
                      style: Theme.of(context).textTheme.titleLarge,),

                    const SizedBox(height:6,),

                    Text("A 6 digit verification pin will sent on your email address",
                      style: Theme.of(context).textTheme.bodyMedium,),
                    const SizedBox(height: 20,),

                    TextFormField(
                      controller: _emailEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Enter your email",
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),

                    const SizedBox(height: 20,),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: (){},
                          child: const Icon(Icons.arrow_circle_right_outlined,size: 30,)
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

