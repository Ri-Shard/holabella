import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  final String? labeltext;
  final Icon? suffix;
  final Icon? prefix;
  final TextEditingController? controller;
  final VoidCallback? suffixTap;
  const CustomText(
      {super.key,
      this.labeltext,
      this.suffix,
      this.prefix,
      this.controller,
      this.suffixTap});

  @override
  State<CustomText> createState() => CustomTextState();
}

class CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          labelText: widget.labeltext,
          suffixIcon: InkWell(
              onTap: widget.suffixTap == null
                  ? () {}
                  : () {
                      widget.suffixTap!();
                      setState(() {});
                    },
              child: widget.suffix ??
                  const Icon(
                    Icons.ac_unit,
                    color: Colors.transparent,
                  )),
          prefixIcon: widget.prefix,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)))),
    );
  }
}
