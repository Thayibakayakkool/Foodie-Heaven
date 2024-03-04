import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';

class Utils {
  void flutterToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      backgroundColor: AppColors().amber,
      textColor: AppColors().blackColors,
      timeInSecForIosWeb: 4,
      fontSize: 14,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  showSnackBar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors().amber,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(content),
          ],
        ),
      ),
    );
  }

  loadingWidget() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors().amber,
      ),
    );
  }
}
