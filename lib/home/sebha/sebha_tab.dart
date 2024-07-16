import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/colors.dart';
import 'package:islamy/provider/app_config_provider.dart';

class Sebha extends StatefulWidget {
  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> with TickerProviderStateMixin {
  int counter = 0;
  int index = 0;

  late AnimationController _controller;
  late Animation<double> _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(
          milliseconds: 15000,
        ),
        vsync: this,
        value: 0.25,
        lowerBound: 0.25,
        upperBound: 0.5);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> listAd3ya = [
      AppLocalizations.of(context)!.sobhan_allah,
      AppLocalizations.of(context)!.alhamdullah,
      AppLocalizations.of(context)!.allah_akber,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                "assets/images/head_seb7a.png",
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Positioned(
                  top: 43,
                  child: RotationTransition(
                    turns: _animation,
                    child: Image.asset(
                      "assets/images/body_seb7a.png",
                      height: MediaQuery.of(context).size.width * 0.35,
                    ),
                  )),
            ],
          ),
        ),
        Text(
          AppLocalizations.of(context)!.tsbeh,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
        ),
        Container(
          padding: const EdgeInsets.all(3),
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.4,
          ),
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            '$counter',
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.07,
            horizontal: MediaQuery.of(context).size.width * 0.2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColor.primaryColor)),
            onPressed: () {
              onTsbeh();
            },
            child: Text(
              listAd3ya[index],
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  onTsbeh() {
    counter++;
    if (counter == 33) {
      index = 1;
    } else if (counter == 66) {
      index = 2;
    } else if (counter == 99) {
      counter = 0;
      index = 0;
    }
    setState(() {});
  }
}
