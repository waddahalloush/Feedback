import 'package:flutter/material.dart';

void successSnackBar(BuildContext context, String note) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      content: Text(
        note,
        textAlign: TextAlign.center,
        style: Theme.of(context).primaryTextTheme.headline5,
      ),
      backgroundColor: Colors.green,
    ));
void errorSnackBar(BuildContext context, String note) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      content: Text(
        note,
        textAlign: TextAlign.center,
        style: Theme.of(context).primaryTextTheme.headline5,
      ),
      backgroundColor: Colors.red,
    ));
