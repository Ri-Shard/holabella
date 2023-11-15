import 'package:flutter/material.dart';
import 'package:holabella/ui/resources/my_theme.dart';

class Buttons extends StatefulWidget {
  final Widget? content;
  final Color? color;
  final VoidCallback? ontap;
  final Color? borderColor;
  final double? borderradius;

  const Buttons(
      {super.key,
      this.content,
      this.color,
      this.ontap,
      this.borderColor,
      this.borderradius});

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
          borderRadius: BorderRadius.circular(widget.borderradius ?? 100),
          side: BorderSide(color: widget.borderColor ?? MyTheme.ocreBase)),
      child: widget.content,
    );
  }
}
