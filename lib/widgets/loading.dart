import 'package:flutter/material.dart';

class Loading {
  static showLoadingDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            children: <Widget>[
              Center(
                child: Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(41, 135, 135, 135),
                        offset: Offset(0, 3),
                        blurRadius: 20,
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              )
            ],
          );
        });
  }

  static hideLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
