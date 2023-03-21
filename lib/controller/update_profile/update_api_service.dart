import 'dart:convert';

import 'package:api_integration_project/controller/update_profile/update_constants.dart';
import 'package:api_integration_project/controller/update_profile/update_key.dart';
import 'package:api_integration_project/model/authModel_update.dart';
import 'package:http/http.dart' as http;


class UpdateApiService {
  static Future<AuthUpdate?> updateM(
    String name,
    String email,
    String country,
    String phone_dial_code,
    String phone,
    String gender,
  ) async {
    var response = await http.put(Uri.parse(UpdateConstants.updateUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "api_key": UpdateConstants.updateApiKey,
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZmFmZmQ2MTVlZjJhZTY4OTYxZDVhNSIsIm5hbWUiOiJhYnVsIiwicm9sZSI6ImVtcGxveWVlIiwiaWF0IjoxNjc5MzMxNzcyLCJleHAiOjE2Nzk0MTgxNzJ9.KqApUF2BU2Z-BkgQ7MPA4tyJ7vcaS_eahqC1XbSF1TI"
        },
        body: jsonEncode({
          UpdateKeyWord.name: name,
          UpdateKeyWord.email: email,
          UpdateKeyWord.country: country,
          UpdateKeyWord.dail_code: phone_dial_code,
          UpdateKeyWord.phone: phone,
          UpdateKeyWord.gender: gender,
        }));
    if(response.statusCode == 200){
      AuthUpdate authUpdate = AuthUpdate.fromJson(jsonDecode(response.body));
          return authUpdate;
    }else{
      print("error");
    }
  }
}
