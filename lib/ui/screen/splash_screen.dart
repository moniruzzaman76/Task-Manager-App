import 'package:flutter/material.dart';
import 'package:task_manager/data/model/auth_utility.dart';
import 'package:task_manager/ui/assets_utils/assets_utils.dart';
import 'package:task_manager/widgets/background_images.dart';
import 'bottom_nab_bar_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigatorToLogin();
  }

  Future<void> navigatorToLogin() async {
    Future.delayed(const Duration(seconds: 3)).then((value) async{
       final bool isLoggedIn = await AuthUtility.checkIfUserLoggedIn();

       if(mounted){
         Navigator.pushAndRemoveUntil(context,
             MaterialPageRoute(builder: (context) =>
             isLoggedIn ?  const BottomNabBarScreen() :  const LoginScreen()),
                 (route) => false);
       }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          ScreenBackGround(
              child:  Center(
                child: Image.asset(
                  AssetUtils.splashLogo,
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
          )

        ],
      ),
    ));
  }
}
