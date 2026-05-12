import 'package:bkashclone/core/provider/language_provider/language_provider.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageChangeButton extends StatefulWidget {
  const LanguageChangeButton({super.key});

  @override
  State<LanguageChangeButton> createState() => _LanguageChangeButtonState();
}

class _LanguageChangeButtonState extends State<LanguageChangeButton> {
  final List<String> name = ["Eng", "বাং"];

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, language, _) {
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
                    context.read<LanguageProvider>().languageChange(index);
                  },
                  child: Container(
                    margin: EdgeInsets.all(0.5),
                    height: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: index == language.index
                            ? ThemeColors.primary
                            : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(3.5, 3.5),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        name[index],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: .w600,
                          color: index == language.index
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
      },
    );
  }
}
