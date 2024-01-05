import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holabella/ui/resources/my_theme.dart';

class CustomListTile extends StatelessWidget {
  final String? name;
  final String? person;
  final VoidCallback? ontap;
  final String? price;
  final String? date;

  const CustomListTile(
      {super.key, this.ontap, this.price, this.name, this.person, this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name!,
                style: MyTheme.basicTextStyle(
                  color: MyTheme.ocreBase,
                  size: 16,
                )),
            Text(person!,
                style: MyTheme.basicTextStyle(
                    color: MyTheme.ocreBajo,
                    size: 16,
                    fontWeight: FontWeight.normal)),
            Text(date!,
                style: MyTheme.basicTextStyle(
                    color: MyTheme.ocreBajo,
                    size: 14,
                    fontWeight: FontWeight.normal)),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Text(price!,
                style: MyTheme.basicTextStyle(
                    color: MyTheme.ocreBajo,
                    size: 14,
                    fontWeight: FontWeight.normal)),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete_outline,
                color: MyTheme.ocreBajo,
              ),
            )
          ],
        ),
      ],
    );
  }
}
