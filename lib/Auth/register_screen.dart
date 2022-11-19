import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.grey[400],
        onPressed: () {
          Navigator.pop(context);
        }
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset('assets/images/facebook.png',width: double.infinity,),
                  Image.asset('assets/images/google.png',width: double.infinity,),
                ],
              ),
              SizedBox(height: 30,),
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
                    decoration: InputDecoration(
                        hintText: "Full Name"
                    ),
                    validator: RequiredValidator(errorText: "Full Name is required!"),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: "Phone Number",
                      prefixIcon: Icon(Icons.flag)
                    ),
                    validator: MultiValidator(
                        [
                          LengthRangeValidator(min: 8, max: 8, errorText: "Phone must have 8 digits!"),
                          RequiredValidator(errorText: "Phone number is required!"),
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
                          MinLengthValidator(6, errorText: "Password must have at least 6 characters"),
                          RequiredValidator(errorText: "Password is required!"),
                        ]
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
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
              SizedBox(height: 30,),
              Row(
                children: [
                  Text("Government Verification ", style: TextStyle(color: Colors.black, fontSize: 16),),
                  Text("(Optional)", style: TextStyle(color: Colors.grey),),
                ],
              ),
              Text("We value your privacy. Identity will be used for Safety of"
                "Platform and society, It will not be disclosed to 3rd parties.",
                style: TextStyle(color: Colors.grey),),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 30,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 30,
                    color: Colors.blue,
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Login")),
                    ],
                  ),
                  ElevatedButton(onPressed: (){}, child: Text("Register")),
                  SizedBox(height: 40,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
