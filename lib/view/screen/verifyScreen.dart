import 'package:api_integration_project/view/screen/set_pass_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../../controller/verifyotp/verify_api_service.dart';
import '../../model/auth_verify.dart';


class Verify extends StatefulWidget {

  final String id;

  const Verify({Key? key, required this.id}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {

  final TextEditingController _otpVerify = TextEditingController();
  Auth_veridy? auth_veridy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Text(
                    "We have sent a verification code to 01XXXXXXXXX Put the OTP to verify.",
                    style: TextStyle(color: Color(0xFF192855), fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                TextField(
                  controller: _otpVerify,
                  decoration: InputDecoration(hintText: "otpcode"),
                ),

                SizedBox(
                  height: 20,
                ),

               ElevatedButton(
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>
                  SetPassScreen(id: widget.id, otp: _otpVerify.text,))); //() ai tar viote lekhte hoi ja ja ami porer page a use korte chai na
                      auth_veridy = await VerifyService.verifyMethod(

                        widget.id,  //aita lekhte hoi pore page a na lekhar jonno

                        _otpVerify.text,
                      );
                      setState(() {});
                    },
                    child: Text("Verify")),
                SizedBox(
                  height: 20,
                ),
                auth_veridy == null
                    ? CircularProgressIndicator()
                    : Text("message is : ${auth_veridy!.status}"),
                // TextButton(
                //   onPressed: (){
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (c) =>  ResetPassword()));
                //   },

                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
