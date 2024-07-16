// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ItemSuraDetails extends StatelessWidget {
  String content;
  int index;
  ItemSuraDetails({
    Key? key,
    required this.content,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$content (${index + 1})\n',
      textDirection: TextDirection.rtl,
    );
  }
}
