
import 'package:api_integration_project/view/login_page_ar_por/drawer.dart';
import 'package:flutter/material.dart';

import 'checkingIn.dart';


class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const ReusableDrawer(),
      appBar: AppBar(
        leading: GestureDetector(
          child: Image.asset("Assets/Images/Logo6.png",height: 10,width: 10,),
          onTap: (){
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
              //close drawer, if drawer is open
            } else {
              scaffoldKey.currentState!.openDrawer();
              //open drawer, if drawer is closed
            }
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('CHECK IN',style: TextStyle(color: Color(0xFF192855),fontWeight: FontWeight.bold,fontSize: 25),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(40)),
            Center(child: Text("February 14, 2023",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Color(0xFF192855)),)),
            Text("5 : 30  PM",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Color(0xFF192855)),),
            SizedBox(height: 10,),
            Text("Hello Muksitur",style: TextStyle(fontSize: 20,color: Color(0xFFFE8100)),),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (c) =>  chekin()));
              },
              child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 5,color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset("Assets/Images/Logo3.png")
              ),
            ),
            SizedBox(height: 20,),
            Text("CHECK IN",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w400,color: Color(0xFF192855)),),
          ],
        ),
      ),

    );
  }
}


