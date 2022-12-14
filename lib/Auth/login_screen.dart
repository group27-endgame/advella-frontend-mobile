import 'package:advella/Auth/profile_screen.dart';
import 'package:advella/Auth/register_screen.dart';
import 'package:advella/models/user_model.dart';
import 'package:advella/screens/bottom_nav_bar.dart';
import 'package:advella/services/auth_service.dart';
import 'package:advella/services/local_storage/localstorage_user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _authService = AuthService();
  final _authStorage = UserLocalStorageService();

  final _formKey = GlobalKey<FormState>();

  String _username = "", _password = "", _errorMessage = "";
  bool _error = false;

  @override
  Widget build(BuildContext context) {

    UserLocalStorageService().isLoggedIn().then((value) => {
      if(value){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNavBar()),
          )
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 950,//double.infinity,
              color: Colors.white,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage("assets/images/bg.png"),
              //         fit: BoxFit.cover,
              //         colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
              //     )
              // ),
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50)
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(defaultPadding, defaultPadding*2.2, defaultPadding, defaultPadding/2),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Text("Login", style: TextStyle(color: Colors.grey[900], fontSize: 30, fontWeight: FontWeight.bold),),
                          ),
                          TextFormField(
                            validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: "Username is required")
                                ]
                            ),
                            obscureText: false,
                            onChanged: (username){
                              setState(() {
                                _username = username;
                              });
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Username"
                            ),
                          ),
                          SizedBox(height: defaultPadding,),
                          TextFormField(
                            validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: "Password field is required"),
                                  MinLengthValidator(5, errorText: "Password must have at least 5 characters")
                                ]
                            ),
                            obscureText: true,
                            onChanged: (password) {
                              setState(() {
                                _password = password;
                              });
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Password"
                            ),
                          ),
                          SizedBox(height: defaultPadding/2,),
                          Row(
                            children: [
                              Text("Don't have account yet?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                                  );
                                },
                                child: Text("Click here to register!"),
                              )
                            ],
                          ),
                          SizedBox(height: defaultPadding/2,),
                          _error ? Text(_errorMessage, style: TextStyle(color: Colors.red),) : Container(),
                          _error ? SizedBox(height: defaultPadding/2,) : Container(),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async{
                                if(_formKey.currentState!.validate()) {
                                  var user = await _authService.loginUser(
                                      _username, _password);
                                  if (user == null) {
                                    print("Error");
                                    _error = true;
                                    _errorMessage = "Wrong password or account does not exist";
                                  }
                                  else {
                                    await _authStorage.saveUser(user).then((value) => {

                                        Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => BottomNavBar()),
                                      )
                                    });
                                  }
                                }
                              },
                              child: Text("Login"),
                              style: ElevatedButton.styleFrom(primary: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.05,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      'assets/images/advella-logo.png',
                    ),
                  ),
                  //child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                )
            ),
          ],
        ),
      ),
    );
  }
}