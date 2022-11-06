import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.grey[400],
        onPressed: () {}
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Welcome to FindHelpie!", style: TextStyle(color: Colors.grey, fontSize: 16),),
            Column(
              children: [
                Image.asset('assets/images/facebook.png',width: double.infinity,),
                Image.asset('assets/images/google.png',width: double.infinity,),
              ],
            ),
            Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Email Address"
                  ),
                  validator: MultiValidator(
                      [
                        EmailValidator(errorText: "Use valid email!"),
                        RequiredValidator(errorText: "Email is required!"),
                      ]
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                  ),
                  validator: MultiValidator(
                      [
                        EmailValidator(errorText: "Use valid email!"),
                        RequiredValidator(errorText: "Email is required!"),
                      ]
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account yet?"),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, "/register");
                    }, child: Text("Register")),
                  ],
                ),
                ElevatedButton(onPressed: (){}, child: Text("Login")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
