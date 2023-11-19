import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  final String? labeltext;
  final Widget? suffix;
  final Icon? prefix;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool? obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomText(
      {super.key,
      this.labeltext,
      this.suffix,
      this.prefix,
      this.controller,
      this.inputType,
      this.obscureText,
      this.onChanged,
      this.validator});

  @override
  State<CustomText> createState() => CustomTextState();
}

class CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: widget.obscureText ?? false,
      keyboardType: widget.inputType,
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          labelText: widget.labeltext,
          suffixIcon: widget.suffix ??
              const Icon(
                Icons.ac_unit,
                color: Colors.transparent,
              ),
          prefixIcon: widget.prefix,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)))),
    );
  }
}
