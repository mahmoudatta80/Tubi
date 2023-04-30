import 'package:flutter/material.dart';

Widget defaultElevatedButton({
  required String text,
  required Function function,
}) =>
    ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff1A2636),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(
            double.infinity,
            50,
          ),
        ),
      ),
      onPressed: function(),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );

Widget defaultTextFormField({
  required TextEditingController nameController,
  TextEditingController? emailController,
  TextEditingController? phoneController,
  TextEditingController? passwordController,
}) =>
    TextFormField(
      controller: nameController,
      cursorColor: const Color(0xff1A2636),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff1A2636),
          ),
        ),
        label: const Text(
          'User Name',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
        fillColor: const Color(0xff1A2636),
        focusColor: const Color(0xff1A2636),
        hoverColor: const Color(0xff1A2636),
      ),
    );
