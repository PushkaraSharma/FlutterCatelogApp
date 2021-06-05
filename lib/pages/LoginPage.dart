import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trailapp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _name = "";
  bool _changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homePageRoute);
      setState(() {
        _changeButton = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
                height: 260,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Welcome " + _name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Username", hintText: "Enter Username"),
                        onChanged: (value) {
                          _name = value;
                          setState(() {});
                        },
                        validator: (value){
                          if(value!.isEmpty)
                            return "UserName cannot be empty";
                          if(value.length<6)
                            return "UserName cannot be less than 6 characters";
                        },
                      ),
                      TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Enter Password"),
                      validator: (value){
                        if(value!.isEmpty)
                          return "Password cannot be empty";
                        if(value.length<6)
                          return "Password cannot be less than 6 characters";
                      },),
                      SizedBox(
                        height: 25,
                      ),
                      Material(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(_changeButton ? 50 : 8),
                        child: InkWell(
                          onTap: () => moveToHome(),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 50,
                            width: _changeButton ? 50 : 150,
                            child: _changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
