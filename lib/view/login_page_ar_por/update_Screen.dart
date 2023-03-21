import 'package:api_integration_project/controller/profile/api_profile.dart';
import 'package:api_integration_project/controller/update_profile/update_api_service.dart';
import 'package:api_integration_project/model/authModel_update.dart';
import 'package:flutter/material.dart';

class UserProfileForm extends StatefulWidget {
  const UserProfileForm({Key? key}) : super(key: key);

  @override
  _UserProfileFormState createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneCountryController = TextEditingController();
  final _phoneDialCodeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _genderController = TextEditingController();
  AuthUpdate? authUpdate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneCountryController,
                decoration: InputDecoration(
                  labelText: 'Bangladesh',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone country';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneDialCodeController,
                decoration: InputDecoration(
                  labelText: '+880',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone dial code';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: '1xxxxxxxxxx',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _genderController,
                decoration: InputDecoration(
                  labelText: 'Gender Male?Female',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your gender';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  authUpdate = await UpdateApiService.updateM(
                      _nameController.text,
                      _emailController.text,
                      _phoneCountryController.text,
                      _phoneDialCodeController.text,
                      _phoneController.text,
                      _genderController.text);

                  setState(() {});

                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => api_profile()));

                  if (_formKey.currentState!.validate()) {
                    // TODO: handle form submission
                  }
                  SizedBox(height: 30,);
                },
                child: Center(child: Text('Save')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:update_profile/controller/update_api_service.dart';
// import 'package:update_profile/kasem.dart';
// import 'package:update_profile/model/authModel_update.dart';
//
// class UpdateScreen extends StatefulWidget {
//   const UpdateScreen({Key? key}) : super(key: key);
//
//   @override
//   State<UpdateScreen> createState() => _UpdateScreenState();
// }
//
// class _UpdateScreenState extends State<UpdateScreen> {
//   final TextEditingController _name = TextEditingController();
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _phone_country = TextEditingController();
//   final TextEditingController _phone_dial_code = TextEditingController();
//   final TextEditingController _phone = TextEditingController();
//   final TextEditingController _gender = TextEditingController();
//   AuthUpdate? authUpdate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(15),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: _name,
//               decoration: InputDecoration(
//                 hintText: ("name"),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: _email,
//               decoration: InputDecoration(
//                 hintText: ("email"),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: _phone_country,
//               decoration: InputDecoration(
//                 hintText: ("country"),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: _phone_dial_code,
//               decoration: InputDecoration(
//                 hintText: ("country-code"),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: _phone,
//               decoration: InputDecoration(
//                 labelText: ("phone_number"),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: _gender,
//               decoration: InputDecoration(
//                 hintText: ("Male/Female"),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 authUpdate = await UpdateApiService.updateM(
//                     _name.text,
//                     _email.text,
//                     _phone_country.text,
//                     _phone_dial_code.text,
//                     _phone.text,
//                     _gender.text);
//                 setState(() {});
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (c) => kasem()));
//               },
//               child: Text("Save"),
//             ),
//             SizedBox(height: 10,),
//             authUpdate ==null?
//                 CircularProgressIndicator()
//                 :Text("message is : ${authUpdate!.message}"),
//           ],
//         ),
//       ),
//     );
//   }
// }
