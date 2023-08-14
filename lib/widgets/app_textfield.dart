import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.validator,
    required this.name,
    this.hintText,
    this.isObscureText = false,
  });
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final String name;
  final String? hintText;
  final bool isObscureText;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Align(
      alignment: Alignment.center,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$name:',
                // textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
                width: size.width - 40,
                child: TextFormField(
                  controller: controller,
                  validator: validator,
                  obscureText: isObscureText,
                  decoration: InputDecoration.collapsed(
                    hintText: isObscureText ? '********' : hintText,
                    hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(.5),
                    ),
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
