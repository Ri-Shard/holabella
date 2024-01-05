import 'package:flutter/material.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:searchfield/searchfield.dart';

class CustomSelect extends StatefulWidget {
  final List<String> items;
  final String? title;
  final Widget? prefix;
  final Widget? suffix;

  const CustomSelect(
      {super.key,
      required this.title,
      required this.items,
      this.prefix,
      this.suffix});

  @override
  State<CustomSelect> createState() => _CustomSelectState();
}

class _CustomSelectState extends State<CustomSelect> {
  @override
  Widget build(BuildContext context) {
    return SearchField(
      searchInputDecoration: InputDecoration(
          prefixIcon: widget.prefix ?? null,
          suffixIcon:
              widget.suffix ?? const Icon(Icons.arrow_drop_down_rounded),
          labelText: widget.title,
          hintStyle: const TextStyle(color: MyTheme.ocreBase),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100))),
      marginColor: MyTheme.ocreBase,
      hint: 'Seleccione',
      suggestionsDecoration: SuggestionDecoration(
          padding: const EdgeInsets.all(4),
          border: Border.all(color: MyTheme.ocreOscuro),
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(10))),
      suggestions: widget.items
          .map((e) => SearchFieldListItem(e,
              child: Text(
                e,
                style: MyTheme.basicTextStyle(
                    color: MyTheme.ocreOscuro, fontWeight: FontWeight.w500),
              )))
          .toList(),
    );
  }
}
