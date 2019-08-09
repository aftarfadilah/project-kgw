import 'package:flutter/material.dart';

class UtilGradientButton {

  /*
   * This function builds the GradientButton Widget.
   *
   * @params a list of colors
   * @params a string to be the button name
   * @params a callback to be executed
   * @return the builded Widget
   */
    Container buildGradientButton(List<Color> colors, String label, Function callback) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.centerRight,
            ),
            borderRadius: BorderRadiusDirectional.circular(10)),
        child: MaterialButton(
          onPressed: callback,
          padding: EdgeInsets.symmetric(horizontal: 50),
          minWidth: 100,
          height: 20,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10)),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
    );
  }
}