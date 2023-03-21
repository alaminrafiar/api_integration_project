import 'package:api_integration_project/controller/profile/api_profile.dart';
import 'package:api_integration_project/view/login_page_ar_por/changePassword.dart';
import 'package:api_integration_project/view/screen/login_scren.dart';
import 'package:flutter/material.dart';


class ReusableDrawer extends StatelessWidget {
  const ReusableDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child:  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 280,
              width: 350,
              decoration: BoxDecoration(
                color: Color(0xFFFE8100),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 5,color: Colors.white),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("Assets/Images/alamin.jpg"),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Md Alamin ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  Text("EID : GV001",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w300),),
                ],
              ),
            ),
            SizedBox(height: 50,),
            TextButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) =>  api_profile()));
              },
              child: Container(
                height: 50,
                width: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(150),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200,spreadRadius: 2,blurRadius: 0)
                  ],
                ),
                child: Center(
                  child: Text("Profile",style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) =>  ChangePasswordScreen()));
              },
              child: Container(
                height: 50,
                width: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(150),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200,spreadRadius: 2,blurRadius: 0)
                  ],
                ),
                child: Center(
                  child: Text("Change Password",style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            ),
            SizedBox(height: 270),
            TextButton(onPressed: (){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (c) =>  HomeScreen()));
            },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("LogOut",style: TextStyle(color: Color(0xFF192855),fontWeight: FontWeight.bold),),
                  Icon(Icons.forward),
                ],
              ),
            ),
            Image.asset("Assets/Images/Logo.png",height: 50,width: 50,),
          ],
        ),
      ),
    );
  }
}

