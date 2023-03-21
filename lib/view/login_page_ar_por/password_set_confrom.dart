import 'package:api_integration_project/view/screen/attendance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordSet extends StatefulWidget {
  const PasswordSet({Key? key}) : super(key: key);

  @override
  State<PasswordSet> createState() => _PasswordSetState();
}

class _PasswordSetState extends State<PasswordSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 200),
          child: Column(
            children: [
              Center(child: Image.asset("Assets/Images/Logo2.png",height: 200,width: 200,)),
              SizedBox(height: 20,),
              Text("Your New Password is Set",style: TextStyle(color: Color(0xFF192855),fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),
              TextButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (c) =>  Attendance()));
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(150),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade200,spreadRadius: 2,blurRadius: 0)
                    ],
                  ),
                  child: Center(
                    child: Text("Home",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 200,),
              Image.asset("Assets/Images/Logo.png",height: 70,width: 70,),
              Text("Employee Attendance",style: TextStyle(color: Color(0xFF192855),fontSize: 15,fontWeight: FontWeight.w400),),
            ],
          ),
        ),
      ),
    );
  }
}
