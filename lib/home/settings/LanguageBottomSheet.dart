import 'package:flutter/material.dart';
import 'package:islamy/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  bool isEnglish = true;
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AppConfigProvider>(context);

    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isEnglish == true
              ? ItemIsSelected(
                  pro,
                  AppLocalizations.of(context)!.english,
                  "en",
                  true
                )
              : ItemIsNotSelected(
                  pro,
                  AppLocalizations.of(context)!.english,
                  "en",
                  true
                ),
          const SizedBox(
            height: 10,
          ),
          isEnglish == false
              ? ItemIsSelected(
                  pro,
                  AppLocalizations.of(context)!.arabic,
                  "ar",
                  false
                )
              : ItemIsNotSelected(
                  pro,
                  AppLocalizations.of(context)!.arabic,
                  "ar",
                  false
                ),
        ],
      ),
    );
  }

  ItemIsSelected(provider, String language, String languagecode,bool isEng) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              isEnglish = isEng;
              provider.changeLang(languagecode);
            },
            child: Text(
              language,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.primaryColor,
                  ),
            )),
        const Icon(
          Icons.check,
          size: 30,
          color: AppColor.primaryColor,
        )
      ],
    );
  }

  ItemIsNotSelected(
      AppConfigProvider pro, String language, String LanguageCode,bool isEng) {
    return InkWell(
      onTap: () {
        isEnglish = isEng;

        pro.changeLang(LanguageCode);
      },
      child: Text(

        language,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
