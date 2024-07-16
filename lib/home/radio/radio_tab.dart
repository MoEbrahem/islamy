import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Radio_tab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/Radio_logo.png",
          width: double.infinity,
          height: 220,
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
          AppLocalizations.of(context)!.eza3a,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 55,
        ),
        Image.asset("assets/images/player.png"),
      ],
    );
  }
}
