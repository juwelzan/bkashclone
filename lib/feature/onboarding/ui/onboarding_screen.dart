import 'package:bkashclone/feature/onboarding/model/onboarding_item.dart';
import 'package:bkashclone/shared/widgets/bkash_end_dower.dart';
import 'package:bkashclone/shared/widgets/bkash_service_container.dart';
import 'package:bkashclone/shared/widgets/category/offer_section.dart';
import 'package:bkashclone/shared/widgets/category/other_services_section.dart';
import 'package:bkashclone/shared/widgets/category/suggestion_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: BkashEndDower(),
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: Column(children: [Image.asset(PngAssets.banner)]),
          // ),
          // Builder(
          //   builder: (context) {
          //     return BkashMenuButton(
          //       onTap: () {
          //         Scaffold.of(context).openEndDrawer();
          //       },
          //     );
          //   },
          // ),
          // Positioned.fill(
          //   child: DraggableScrollableSheet(
          //     initialChildSize: 0.84,
          //     minChildSize: 0.84,
          //     maxChildSize: 1.0,
          //     builder: (context, scrollController) {
          //       return Container(
          //         decoration: BoxDecoration(
          //           color: ThemeColors.surface,
          //           borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(20),
          //             topRight: Radius.circular(20),
          //           ),
          //         ),
          //         // child: ListView.builder(
          //         //   addAutomaticKeepAlives: false,
          //         //   addRepaintBoundaries: true,
          //         //   controller: scrollController,
          //         //   itemCount: item.length,
          //         //   itemBuilder: (context, index) {
          //         //     return _itemBoulder(item[index]);
          //         //   },
          //         // ),
          //       );
          //     },
          //   ),
          // ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     height: 180,
          //     decoration: BoxDecoration(
          //       color: ThemeColors.primary,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(20),
          //         topRight: Radius.circular(20),
          //       ),
          //     ),
          //     padding: EdgeInsets.all(10),
          //     child: Column(
          //       mainAxisAlignment: .spaceEvenly,
          //       children: [
          //         Text(
          //           context.l10n!.greatservicesawait,
          //           style: TextStyle(
          //             fontSize: 20,
          //             fontWeight: .bold,
          //             color: ThemeColors.surface,
          //           ),
          //         ),
          //         SizedBox(
          //           width: double.infinity,

          //           child: ElevatedButton(
          //             style: ElevatedButton.styleFrom(
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadiusGeometry.circular(10),
          //               ),
          //             ),
          //             onPressed: () {},
          //             child: Text(
          //               context.l10n!.login,
          //               style: TextStyle(
          //                 fontSize: 18,
          //                 fontWeight: .w500,
          //                 color: ThemeColors.primary,
          //               ),
          //             ),
          //           ),
          //         ),
          //         Text(
          //           context.l10n!.changebKashnumber,
          //           style: TextStyle(
          //             fontSize: 18,
          //             fontWeight: .w500,
          //             color: ThemeColors.surface,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          ///StatusBarBlur
          // Positioned(top: 0, left: 0, right: 0, child: StatusBarBlur()),
        ],
      ),
    );
  }

  List<OnboardingItem> item = [
    OnboardingItem(type: "BkashServiceContainer"),
    OnboardingItem(type: "SuggestionSection"),
    OnboardingItem(type: "OfferSection"),
    OnboardingItem(type: "OtherServicesSection"),
  ];
  Widget _itemBoulder(OnboardingItem item) {
    switch (item.type) {
      case "BkashServiceContainer":
        return BkashServiceContainer();
      case "SuggestionSection":
        return SuggestionSection();
      case "OfferSection":
        return OfferSection();
      case "OtherServicesSection":
        return OtherServicesSection();
      default:
        return SizedBox();
    }
  }
}
// BkashServiceContainer,
//                         AppRegularFeature(),
//                         SuggestionSection(),
//                         OfferSection(),
//                         OtherServicesSection(),
//                         SizedBox(height: 250),