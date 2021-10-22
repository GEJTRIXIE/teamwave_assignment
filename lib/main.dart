import 'package:flutter/material.dart';
import 'package:sports_teamwave/screens/sports_db_screen.dart';

 main() async {
   runApp(MaterialApp(
    debugShowMaterialGrid: false,
    debugShowCheckedModeBanner: false,
    home: SportsDbScreen(),
  ),
  );
}