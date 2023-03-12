import 'dart:convert';

import 'package:api_integration_project/controller/setpasswprd/setpassword_keywords.dart';
import 'package:http/http.dart' as http;


import '../../model/Auth_Set_Pass.dart';
import 'constrans_setpassword.dart';

class SetPaswordService {
  static Future<Auth_Set_Pass?> methodset (
    String id,
    String otp,
    String pass,
    String newpas,
  ) async {
    var response = await http.post(Uri.parse(SetPassWordService.setPassUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "api_key": '5267556B58703273357638792F423F45',
        },
        body: jsonEncode({
          SetPassKeyWord.employee_id: id,
          SetPassKeyWord.otp_code: otp,
          SetPassKeyWord.password: pass,
          SetPassKeyWord.c_password: newpas,
        }));
    if (response.statusCode == 200){
   Auth_Set_Pass auth_set_pass = Auth_Set_Pass.fromJson(jsonDecode(response.body));
   return auth_set_pass;
    }else{
      print("error"); // baki ase to screen
    }
  }
}
