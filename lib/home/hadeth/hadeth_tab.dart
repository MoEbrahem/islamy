// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/colors.dart';
import 'package:islamy/home/hadeth/hadeth_name.dart';

class HadethTab extends StatelessWidget {
  List<String> Titles = [];
  List<String> Lines = [];
  List<HadethArg> listcontent = [];

  @override
  Widget build(BuildContext context) {
    if (Lines.isEmpty) {
      load_Hadeth();
    }
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            "assets/images/hadeth_logo.png",
          ),
        ),
        const Divider(
          thickness: 3,
          color: AppColor.primaryColor,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Divider(
          color: AppColor.primaryColor,
          thickness: 3,
        ),
        Expanded(
          flex: 2,
          child: ListView.separated(
            itemCount: listcontent.length,
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 3,
                color: AppColor.primaryColor,
              );
            },
            itemBuilder: (context, index) {
              return HadethName(
                hadeth: listcontent[index],
              );
            },
          ),
        ),
      ],
    );
  }

  load_Hadeth() async {
    String content = await rootBundle.loadString("assets/ahadeth.txt");
    List<String> ahaeth_content = content.split("#\r\n");
    for (var i = 0; i < ahaeth_content.length; i++) {
      Lines = ahaeth_content[i].split("\n");
      String Title = Lines[0];
      Lines.removeAt(0);
      HadethArg hadeth = HadethArg(title: Title, content: Lines);
      listcontent.add(hadeth);
    }
  }
}

class HadethArg {
  List<String> content;
  String title;
  HadethArg({
    required this.title,
    required this.content,
  });
}
