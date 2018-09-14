import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   final string title;
  
//   LoginScreen({Key key, this.title}) : super(key:key)

//   @override
//   State<
// }

// class LoginState<

class LoginScreen extends StatelessWidget {
  final String title;

  LoginScreen({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    var assetImage = new AssetImage('assets/cLogo.png');
    var image = new Image(image: assetImage, width: 80.0, height: 80.0);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: loginBody(image),
      ),
    );
  }

  loginBody(image) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[loginHeader(image), loginFields()],
      );

  loginHeader(image) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          image,
          SizedBox(
            height: 35.0,
          ),
          Text(
            "Welcome to $title",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.red),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Sign in to continue",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  loginFields() => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Enter your username",
                  labelText: "Username",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  labelText: "Password",
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                shape: StadiumBorder(),
                child: Text(
                  "SIGN IN",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "SIGN UP FOR AN ACCOUNT",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
}