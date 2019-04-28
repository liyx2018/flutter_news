import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';


class ToastUtils{

 static void showToast(@required String msg,{ToastGravity gravity}){
    Fluttertoast.showToast(
      msg: msg,
      gravity: gravity,
      textColor: Colors.white,
      backgroundColor: Colors.deepOrange,
      toastLength: Toast.LENGTH_SHORT,
    );
  }


}