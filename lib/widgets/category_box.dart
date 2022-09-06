import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  final String text;
  final bool selected;
  final void Function() onPressed;
  const CategoryBox({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      color: selected ? Colors.white : Colors.grey,
      minWidth: 100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child:  Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
