import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/model/login_model.dart';


class AuthUtility{

  AuthUtility._();

   static LoginModel userInfo = LoginModel();

  static Future<void>saveUserInfo(LoginModel model)async{
    final SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.setString("user-data", jsonEncode(model.toJson()));
  }

  static Future<LoginModel>getUserInfo()async{
    final SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    String  value = _sharedPrefs.getString("user-data")!;
    return LoginModel.fromJson(jsonDecode(value));
  }

  static Future<void>clearUserInfo()async{
    final SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
  }

  static Future<bool>checkIfUserLoggedIn()async{
    final SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    bool isLogin =  _sharedPrefs.containsKey("user-data");
    if(isLogin){
      userInfo = await getUserInfo();
    }
    return isLogin;
  }

}
