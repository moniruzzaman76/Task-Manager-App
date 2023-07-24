import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/Reset_password_screen.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import '../../widgets/background_images.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {

  final TextEditingController _pinVerificationEditingController= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       child:  SafeArea(
         child: ScreenBackGround(
             child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     const SizedBox(height: 100,),
                     Text("Pin Verification",
                       style: Theme.of(context).textTheme.titleLarge,),

                     const SizedBox(height:6,),

                     Text("A 6 digit verification pin will sent on your email address",
                       style: Theme.of(context).textTheme.bodyMedium,),

                     const SizedBox(height: 20,),

                     PinCodeTextField(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       appContext: context,
                       length: 6,
                       obscureText: false,
                       cursorColor: Colors.green,
                       animationType: AnimationType.fade,
                       keyboardType: TextInputType.phone,
                       pinTheme: PinTheme(
                         shape: PinCodeFieldShape.box,
                         borderRadius: BorderRadius.circular(5),
                         fieldHeight: 50,
                         fieldWidth: 40,
                         activeFillColor: Colors.white,
                         activeColor: Colors.white,
                         inactiveColor: Colors.red,
                         selectedColor: Colors.green,
                         selectedFillColor: Colors.white,
                         inactiveFillColor: Colors.white,
                       ),
                       animationDuration: const Duration(milliseconds: 300),
                       backgroundColor: Colors.blue.shade50,
                       enableActiveFill: true,
                       controller: _pinVerificationEditingController,
                       onCompleted: (v) {
                         print("Completed");
                       },
                       onChanged: (value) {
                         print(value);
                         setState(() {});
                       },
                       beforeTextPaste: (text) {
                         print("Allowing to paste $text");
                         //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                         //but you can show anything you want here, like your pop up saying wrong paste format or etc
                         return true;
                       },
                     ),

                     const SizedBox(height: 20,),

                     SizedBox(
                       height: 40,
                       width: double.infinity,
                       child: ElevatedButton(
                           onPressed: (){
                             Navigator.push(context,
                                 MaterialPageRoute(builder: (context)=>const ResetPasswordScreen()));
                           },
                           child: const Text("Verify"),
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
                           Navigator.pushAndRemoveUntil(context,
                               MaterialPageRoute(builder: (context)=>const LoginScreen()),
                                   (route) => false);
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
      ),
    );
  }
}
