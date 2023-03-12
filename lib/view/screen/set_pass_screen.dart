import 'package:api_integration_project/model/Auth_Set_Pass.dart';
import 'package:flutter/material.dart';

import '../../controller/setpasswprd/set_password_service.dart';


class SetPassScreen extends StatefulWidget {
  const SetPassScreen({Key? key}) : super(key: key);

  @override
  State<SetPassScreen> createState() => _SetPassScreenState();
}

class _SetPassScreenState extends State<SetPassScreen> {
  final TextEditingController _emPloYeId = TextEditingController();
  final TextEditingController _otp = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  Auth_Set_Pass? auth_set_pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("set password"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _emPloYeId,
              decoration: InputDecoration(hintText: "id"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _otp,
              decoration: InputDecoration(hintText: "otp"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _pass,
              decoration: InputDecoration(hintText: "pass"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _newPass,
              decoration: InputDecoration(hintText: "new"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  auth_set_pass = await SetPaswordService.methodset(
                      _emPloYeId.text,
                      _otp.text,
                      _pass.text,
                      _newPass.text);
                  setState(() {});
                },
                child: Text("setpass")),
            SizedBox(height: 20,),
            auth_set_pass ==null ?
                CircularProgressIndicator()
                :Text("message is :${auth_set_pass!.message}"),
          ],
        ),
      ),
    );
  }
}
