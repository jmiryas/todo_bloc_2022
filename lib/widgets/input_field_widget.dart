import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;

  const InputFieldWidget({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            focusColor: Colors.grey.shade200,
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
          ),
          cursorColor: Colors.grey.shade600,
        ),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}
