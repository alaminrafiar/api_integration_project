import 'package:api_integration_project/controller/loginApi/my_service.dart';
import 'package:api_integration_project/model/auth_login.dart';
import 'package:api_integration_project/view/screen/reset/reset_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _employedId = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool passToggle =true;
  AuthLogin? authLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextField(
              controller: _employedId,
             decoration: InputDecoration(
                    hintText: "Employee ID",
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade200,width: 2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200,width: 2),
                        borderRadius: BorderRadius.circular(100),
                    ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200,width: 2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                  ),
                 
                ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _password,
             obscureText: passToggle,
                  decoration: InputDecoration(
                    hintText: "Password",
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade200,width: 2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade200,width: 2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                       focusedBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.grey.shade200,width: 2),
                         borderRadius: BorderRadius.circular(100),
                       ),
                      suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                   
                ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                authLogin = await MyService.mFetchUser(
                  _employedId.text,
                  _password.text,
                );
                setState(() {});
              },
              child: const Text("Login"),
            ),
            SizedBox(
              height: 20,
            ),
            authLogin == null
                ? CircularProgressIndicator()
                : Text("message is : ${authLogin!.message}"),
            SizedBox(
              height: 20,
            ),
           TextButton(
                  onPressed: () {
                    Navigator.push(
                       context,
                        MaterialPageRoute(
                            builder: (c) => const ResetCcreen()));
                  },
                  child: const Text(
                    "Fogot Password",
                    style: TextStyle(color: Color(0xFF192855), fontSize: 18),
                  ),
                ),
          ],
        ),
      ),
      // body: Center(
      //   child: ElevatedButton(child: Text("getUser"),
      //   onPressed: () async {
      //     await MyService.mFetchUser("GV001", "12345678");
      //   },),
      // ),
    );
  }
}
