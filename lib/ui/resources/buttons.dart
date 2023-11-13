import 'package:flutter/material.dart';
import 'package:holabella/ui/resources/my_theme.dart';

class Buttons extends StatefulWidget {
  final Widget? content;
  final Color? color;
  final VoidCallback? ontap;
  final Color? borderColor;

  const Buttons(
      {super.key, this.content, this.color, this.ontap, this.borderColor});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.0,
      onPressed: widget.ontap,
      color: widget.color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(color: widget.borderColor ?? MyTheme.ocreBase)),
      child: widget.content,
    );
  }
}
