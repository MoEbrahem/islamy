// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:islamy/home/quran/quran_details.dart';

class ItemSuraName extends StatelessWidget {
  String suraname;
  int index;
  ItemSuraName({
    Key? key,
    required this.suraname,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            Quran_details.route_Name,
            arguments: Sura_Details(
              name: suraname,
              index: index,
            ),
          );
        },
        child: Text(
          suraname,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ));
  }
}

class Sura_Details {
  String name;
  int index;
  Sura_Details({
    required this.name,
    required this.index,
  });
}
