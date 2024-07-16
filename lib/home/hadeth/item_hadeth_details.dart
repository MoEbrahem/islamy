// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ItemHadethDetails extends StatelessWidget {
  List<String> content;
  ItemHadethDetails({
    Key? key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: content.length,
        itemBuilder: (context, index) {
          return Text(
            "$content[$index]\n",
            textDirection: TextDirection.rtl,
          );
        },
      ),
    );
  }
}
