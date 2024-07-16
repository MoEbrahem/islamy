import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:islamy/colors.dart';
import 'package:islamy/home/quran/item_sura_details.dart';
import 'package:islamy/home/quran/item_sura_name.dart';

class Quran_details extends StatefulWidget {
  static String route_Name = "suraDetailsScreen";

  @override
  State<Quran_details> createState() => _Quran_detailsState();
}

class _Quran_detailsState extends State<Quran_details> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as Sura_Details;
    if (verses.isEmpty) {
      load_file(arg.index);
      }
    return Stack(
      children: [
        Image.asset(
          "assets/images/backgroundScreen.png",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              arg.name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          body: verses.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                )
              : Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06,
                    vertical: MediaQuery.of(context).size.height * 0.04,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.builder(
                    itemCount: verses.length,
                    itemBuilder: (context, index) {
                      return ItemSuraDetails(
                        content: verses[index],
                        index: index,
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }

  load_file(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> Lines = content.split("\n");
    verses = Lines;
    setState(() {});
  }
}
