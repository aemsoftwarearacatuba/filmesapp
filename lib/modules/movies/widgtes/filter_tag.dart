import 'package:filmes_soumei/application/ui/filmes_extensions.dart';
import 'package:filmes_soumei/models/genres_model.dart';
import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  final GenresModel model;
  final bool selected;
  final VoidCallback onPressed;

  const FilterTag(
      {Key? key,
      required this.model,
      this.selected = false,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(5),
        constraints: const BoxConstraints(
          minHeight: 30,
          maxWidth: 100,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: selected ? context.themeRed : Colors.black,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            model.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
