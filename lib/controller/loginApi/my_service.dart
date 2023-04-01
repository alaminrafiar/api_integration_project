import 'dart:convert';

import 'package:api_integration_project/controller/constants.dart';
import 'package:api_integration_project/controller/keywords.dart';
import 'package:api_integration_project/model/auth_login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyService {
  static Future<AuthLogin?> mFetchUser(String id, String pass) async {

    final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();

    var response = await http
        .post(Uri.parse(MyConstants.urlLogin), headers: <String, String>{
      'Content-Type': 'application/json',
      "api_key": '5267556B58703273357638792F423F45',
      // "Authorization":
      //     "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZWM5MGYyYjc2NmFhY2FlZDliOTkxMiIsIm5hbWUiOiJBYmR1bGxhaCBBbCBNYW11biIsInJvbGUiOiJlbXBsb3llZSIsImlhdCI6MTY3ODEwNTA3OSwiZXhwIjoxNjc4MTkxNDc5fQ.5DKEzq8VAknk8BEFfDSSTASXuQvqHovLdooGFyUwB3g"
   
    }, body: jsonEncode({
      MyKeyWords.myEmployee_id: id,
      MyKeyWords.myPassword: pass,
    }));
  
   if (response.statusCode==200){

    AuthLogin authLogin = AuthLogin.fromJson(jsonDecode(response.body));
   
    
    sharedPreferences.setString(MyKeyWords.token, authLogin.token! );
    print("login ${sharedPreferences.getString(MyKeyWords.token)}");

    return authLogin;
   }else{
    print("error");
   
   }
  }

  static methodReset(String text) {}
}
