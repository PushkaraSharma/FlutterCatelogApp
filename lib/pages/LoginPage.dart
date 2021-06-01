import 'package:flutter/material.dart';
import 'package:trailapp/utils/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
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
            "Welcome",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Username", hintText: "Enter Username"),
                  ),
                  TextFormField(
                    obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password", hintText: "Enter Password")
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("Login"),
                    style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    onPressed: (){
                      Navigator.pushNamed(context, MyRoutes.homePageRoute);
                    },
                  )
                ],
              )),
        ],
      ),
    );
  }
}
