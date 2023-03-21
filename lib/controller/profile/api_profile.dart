
import 'package:api_integration_project/controller/profile/my_key%20_words.dart';
import 'package:api_integration_project/controller/profile/user_model.dart';
import 'package:api_integration_project/view/login_page_ar_por/update_Screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../view/login_page_ar_por/EditProfile.dart';

void main() {
  runApp(const api_profile());
}

class api_profile extends StatefulWidget {
  const api_profile({super.key});

  @override
  State<api_profile> createState() => _api_profileState();
}

class _api_profileState extends State<api_profile> {
  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mLoadData().then((value){setState(() {

    });});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Scaffold(
          body: user == null
              ? CircularProgressIndicator()
              : Container(
                  child: Column(
                    children: [
                      Text(user!.id.toString()),
                      Text(user!.employee_id.toString()),
                      Text(user!.name.toString()),
                      Text(user!.email.toString()),
                      Text(user!.phone_country.toString()),
                      Text(user!.phone_dial_code.toString()),
                      Text(user!.phone.toString()),
                      Text(user!.gender.toString()),
                      Text(user!.department.toString()),
                      Text(user!.designation.toString()),
                      Text(user!.imei.toString()),
                      Text(user!.image.toString()),
                      Text(user!.role.toString()),
                      SizedBox(height: 200,),

                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (c)=>UserProfileForm()));
                      }, child: Text("Update")),

                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Future<User?> mLoadData() async {

     var r = await http.get(
          Uri.parse(
              'https://api-attendance.grapview.com/api/v1/employee/profile'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            "api_key": '5267556B58703273357638792F423F45',
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZmFmZmQ2MTVlZjJhZTY4OTYxZDVhNSIsIm5hbWUiOiJhbGFtaW4iLCJyb2xlIjoiZW1wbG95ZWUiLCJpYXQiOjE2NzkzODk1MzQsImV4cCI6MTY3OTQ3NTkzNH0.ZVwIsP38m13ZmEnabklYmrz1aUdswK0oeilmohB0qj4"
          });
      //print("our result:  ${r.body}");
      Map result = json.decode(r.body);
      print("our result: ${result["data"]["name"]}");
      //print("name: ${r.body["name"]}");
      user = User(id: result["data"][MyKeywords.id],
        employee_id:result["data"][MyKeywords.employee_id],
        name:result["data"][MyKeywords.name],
        email: result["data"][MyKeywords.email],
        phone_country:result["data"][MyKeywords.phone_country],
        phone_dial_code:result["data"][MyKeywords.phone_dial_code],
        phone: result["data"][MyKeywords.phone],
        gender: result["data"][MyKeywords.gender],
        department: result["data"][MyKeywords.department],
        designation: result["data"][MyKeywords.designation],
        imei: result["data"][MyKeywords.imei],
        image: result["data"][MyKeywords.image],
        role: result["data"][MyKeywords.role],
      );
      return user;

  }

}
