import 'dart:convert';

import 'package:api_integration_project/controller/resetapi/constants.dart';
import 'package:api_integration_project/controller/resetapi/keywords.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../../model/auth_reset.dart';



class MyResetService {
  static Future<ResetModel?> methodName(
      String id,

      ) async {
    var response = await http.post(Uri.parse(MyResetContants.urlReset),
        headers: <String, String>{
          "Content-Type": "application/json",
          "api_key": MyResetContants.apiKeyr,
          // "Authorization":
          // "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZWM5MGYyYjc2NmFhY2FlZDliOTkxMiIsIm5hbWUiOiJBYmR1bGxhaCBBbCBNYW11biIsInJvbGUiOiJlbXBsb3llZSIsImlhdCI6MTY3ODEwNTA3OSwiZXhwIjoxNjc4MTkxNDc5fQ.5DKEzq8VAknk8BEFfDSSTASXuQvqHovLdooGFyUwB3g"
        },
        body: jsonEncode({
          MyResetKey.employed_id: id,

        }));
    if (response.statusCode == 200) {
      ResetModel resetModel = ResetModel.fromJson(jsonDecode(response.body));
      return resetModel;


      //read response
      // print("message is: ${loginInfo.token}");
    } else {
      print("error");
    }
  }
}
