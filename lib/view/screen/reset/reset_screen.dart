import 'package:api_integration_project/controller/resetapi/api_reset_service.dart';
import 'package:api_integration_project/view/screen/Verifyotp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../model/auth_reset.dart';






class ResetCcreen extends StatefulWidget {
  const ResetCcreen({super.key});

  @override
  State<ResetCcreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ResetCcreen> {
  final TextEditingController employed_id_re = TextEditingController();
  ResetModel? resetModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("hello kasem"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              TextField(
                controller: employed_id_re,
                decoration: InputDecoration(hintText: "ID"),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=> const
                  VerifyOtp()));
                  resetModel = await MyResetService.methodName(
                    employed_id_re.text,
                  );
                  setState(() {});
                  //print("message:${loginInfo!.message}");
                  // var loginData = AuthModel(
                  //         employeeId: _userName.text,
                  //         password: _password.text);
                },

                child: const Text("reset"),
              ),

              SizedBox(
                height: 20,
              ),
              resetModel == null
                  ? CircularProgressIndicator()
                  : Text("message is: ${resetModel!.message} "),
            ],
          ),
        ),
    );
  }
}
