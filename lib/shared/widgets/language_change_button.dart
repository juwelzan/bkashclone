import 'package:bkashclone/core/providers/setting/setting_provider.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageChangeButton extends ConsumerWidget {
  LanguageChangeButton({super.key});

  final List<String> name = ["Eng", "বাং"];
  final List<String> languageName = ["en", "bn"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageRef = ref.watch(settingProviderProvider);
    final languageFun = ref.watch(settingProviderProvider.notifier);
    return SizedBox(
      height: 30,
      width: 80,

      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                languageFun.localeChange(languageName[0]);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                margin: EdgeInsets.all(0.5),
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: languageRef.localeCode == languageName[0]
                        ? ThemeColors.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(3.5, 3.5)),
                ),
                child: Center(
                  child: Text(
                    name[0],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: .w600,
                      color: languageRef.localeCode == languageName[0]
                          ? ThemeColors.primary
                          : ThemeColors.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                languageFun.localeChange(languageName[1]);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                margin: EdgeInsets.all(0.5),
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: languageRef.localeCode == languageName[1]
                        ? ThemeColors.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(3.5, 3.5)),
                ),
                child: Center(
                  child: Text(
                    name[1],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: .w600,
                      color: languageRef.localeCode == languageName[1]
                          ? ThemeColors.primary
                          : ThemeColors.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
