import 'package:flutter/material.dart';
import 'package:islamy/colors.dart';
import 'package:islamy/home/hadeth/hadeth_tab.dart';
import 'package:islamy/home/hadeth/item_hadeth_details.dart';

class Hadeth_Details extends StatelessWidget {
  static String route_Name = "Hadeth_details";

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as HadethArg;
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
              "Islami",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          body: arg.content.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                )
              : Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ItemHadethDetails(content: arg.content)
                ),
        ),
      ],
    );
    
  }
}
