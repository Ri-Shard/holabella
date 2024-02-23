import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/resources/my_theme.dart';

class CustomListTile extends StatefulWidget {
  final String? name;
  final String? person;
  final VoidCallback? ontap;
  final String? price;
  final String? date;
  final Color? color;
  final Widget? iconbutton;

  const CustomListTile(
      {super.key,
      this.iconbutton,
      this.color,
      this.ontap,
      this.price,
      this.name,
      this.person,
      this.date});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.name!,
                style: MyTheme.basicTextStyle(
                  color: widget.color ?? MyTheme.ocreBase,
                  size: 16,
                )),
            Text(widget.person ?? '',
                style: MyTheme.basicTextStyle(
                    color: widget.color ?? MyTheme.ocreBajo,
                    size: 16,
                    fontWeight: FontWeight.normal)),
            Text(widget.date!,
                style: MyTheme.basicTextStyle(
                    color: widget.color ?? MyTheme.ocreBajo,
                    size: 14,
                    fontWeight: FontWeight.normal)),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Text(widget.price ?? '',
                style: MyTheme.basicTextStyle(
                    color: widget.color ?? MyTheme.ocreBajo,
                    size: 14,
                    fontWeight: FontWeight.normal)),
            widget.iconbutton ?? SizedBox(),
          ],
        ),
      ],
    );
  }
}
