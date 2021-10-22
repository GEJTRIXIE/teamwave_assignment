import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textfield extends StatelessWidget {
  final usercontroller,
      onSaved,
      sufficIcon,
      hintText,
      focusNode,
      Type,
      validator,obsecure
      //  condition
      ;

  Textfield({
     Key key,  @required this.usercontroller,
     this.Type,
    @required this.onSaved, this.obsecure,
    @required this.validator,
    @required this.sufficIcon,
    @required this.hintText,
    @required this.focusNode,//@required this.condition,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
            child: TextFormField(
              controller: usercontroller,
                focusNode:focusNode,
              validator:validator ,
              onChanged:onSaved,
              obscureText: obsecure??false,style: GoogleFonts
                .roboto( color: Colors.black,fontSize: 15),
              scrollPadding: EdgeInsets.only(left: 75),
                keyboardType: Type??TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(0.2),
                contentPadding: const EdgeInsets.only(left: 15,),
                hintText: hintText,
                hintStyle:GoogleFonts
                    .roboto(color: Colors.black54,fontSize: 15),
                filled: true,
                suffixIcon: sufficIcon,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.transparent)),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.transparent)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent))
              ))),
    );
  }
}