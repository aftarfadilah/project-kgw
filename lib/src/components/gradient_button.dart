import 'package:flutter/material.dart';
import '../reusable/util_gradient_button.dart';

class GradientButton extends StatefulWidget {
  GradientButtonState createState() => GradientButtonState();
}

class GradientButtonState extends State<GradientButton>
    with UtilGradientButton {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              buildGradientButton(
                [Colors.lightBlueAccent, Colors.blue],
                "Login",
                    () {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Mantap"),
                      )
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}