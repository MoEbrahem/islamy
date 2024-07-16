import 'package:flutter/material.dart';
import 'package:islamy/colors.dart';
import 'package:islamy/home/hadeth/hadeth_tab.dart';
import 'package:islamy/home/quran/quran_tab.dart';
import 'package:islamy/home/sebha/sebha_tab.dart';
import 'package:islamy/home/radio/radio_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/home/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;
  List<Widget> listScreens = [
    Quran_tab(),
    HadethTab(),
    Sebha(),
    Radio_tab(),
    SettingsTab()
  ];
  @override
  Widget build(BuildContext context) {
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
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            height: 70,
            child: BottomNavigationBar(
              elevation: 0,
              unselectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColor.primaryColor,
              currentIndex: currentindex,
              onTap: (value) {
                currentindex = value;
                setState(() {});
              },
              selectedItemColor: Colors.black,
              selectedLabelStyle: const TextStyle(color: Colors.black),
              showUnselectedLabels: false,
              showSelectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.quran,
                  icon: Image.asset(
                    "assets/images/quran_icon.png",
                    height: 30,
                    color: currentindex == 0 ? Colors.black : Colors.white,
                  ),
                ),
                BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.hadeth,
                  icon: Image.asset(
                    "assets/images/hadeth_icon.png",
                    height: 30,
                    color: currentindex == 1 ? Colors.black : Colors.white,
                  ),
                ),
                BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.sebha,
                  icon: Image.asset(
                    "assets/images/sebha.png",
                    height: 30,
                    color: currentindex == 2 ? Colors.black : Colors.white,
                  ),
                ),
                BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.radio,
                  icon: Image.asset(
                    "assets/images/radio.png",
                    height: 30,
                    color: currentindex == 3 ? Colors.black : Colors.white,
                  ),
                ),
                BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.settings,
                  icon: const Icon(Icons.settings),
                )
              ],
            ),
          ),
          body: listScreens[currentindex],
        )
      ],
    );
  }
}
