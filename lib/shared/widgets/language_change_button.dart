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
    return Container(
      height: 35,
      width: 90,
      decoration: BoxDecoration(
        color: ThemeColors.surface,
        borderRadius: BorderRadius.all(Radius.elliptical(4, 4)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      padding: EdgeInsets.all(1),
      child: Row(
        children: List.generate(2, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (index == 1) {
                  ref
                      .read(settingProviderProvider.notifier)
                      .localeChange(languageName[1]);
                } else {
                  ref
                      .read(settingProviderProvider.notifier)
                      .localeChange(languageName[0]);
                }
              },
              child: Container(
                margin: EdgeInsets.all(0.5),
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        languageRef.locale.languageCode == languageName[index]
                        ? ThemeColors.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(3.5, 3.5)),
                ),
                child: Center(
                  child: Text(
                    name[index],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: .w600,
                      color: languageRef.locale == Locale(languageName[index])
                          ? ThemeColors.primary
                          : ThemeColors.secondary,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
