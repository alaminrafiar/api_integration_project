import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';


import '../../model/auth_reset.dart';



class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});


  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {

  final TextEditingController _userName = TextEditingController();
  final TextEditingController _otpcode = TextEditingController();
  ResetModel? resetModel;
  //LoginInfo? loginInfo;

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
                controller: _userName,
                decoration: InputDecoration(hintText: "ID"),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _otpcode,
                decoration: InputDecoration(hintText: "Otpcode"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  // loginInfo = await MyApiService.methodName(
                  //   _userName.text,
                  //   _otpcode.text,
                  // );
                  setState(() {});
                  //print("message:${loginInfo!.message}");
                  // var loginData = AuthModel(
                  //         employeeId: _userName.text,
                  //         password: _password.text);
                },
                child: const Text("Verify"),
              ),
              SizedBox(
                height: 20,
              ),
              resetModel == null
                  ? Container()
                  : Text("message is: ${resetModel!.message} "),

              // loginInfo == null
              //     ? CircularProgressIndicator()
              //     : Text("message is: ${loginInfo!.message} "),
            ],
          ),
        ));
  }
}