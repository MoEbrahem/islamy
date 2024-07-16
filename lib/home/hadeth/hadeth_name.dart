// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:islamy/home/hadeth/hadeth_details.dart';
import 'package:islamy/home/hadeth/hadeth_tab.dart';

class HadethName extends StatelessWidget {
  HadethArg hadeth;
  HadethName({
    Key? key,
    required this.hadeth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Hadeth_Details.route_Name,
            arguments: HadethArg(title: hadeth.title, content: hadeth.content));
      },
      child: Text(
        hadeth.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
