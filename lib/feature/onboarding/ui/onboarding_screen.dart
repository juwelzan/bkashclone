import 'package:bkashclone/core/assets/png_assets.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/feature/onboarding/model/onboarding_item.dart';
import 'package:bkashclone/feature/onboarding/widgets/bottom_user_login_bar.dart';
import 'package:bkashclone/shared/widgets/bkash_end_dower.dart';
import 'package:bkashclone/shared/widgets/bkash_menu_button.dart';
import 'package:bkashclone/shared/widgets/bkash_service_container/bkash_service_container.dart';
import 'package:bkashclone/shared/widgets/category/offer_section.dart';
import 'package:bkashclone/shared/widgets/category/other_services_section.dart';
import 'package:bkashclone/shared/widgets/category/suggestion_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const String name = "OnboardingScreen";
  static const String path = "/OnboardingScreen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  BoxDecoration get _boxDecoration => BoxDecoration(
    color: ThemeColors.surface,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );
  Widget get banner => Positioned.fill(
    child: Column(
      children: [
        Image.asset(
          PngAssets.banner,
          cacheWidth: 500,
          filterQuality: FilterQuality.medium,
        ),
      ],
    ),
  );
  Widget get bottomBar => const BottomUserLoginBar();
  Widget get bodyItem => _Body();
  Widget get body => Positioned.fill(
    child: RepaintBoundary(
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.84,
        minChildSize: 0.84,
        maxChildSize: 1.0,
        builder: (context, scrollController) {
          return DecoratedBox(
            decoration: _boxDecoration,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [bodyItem],
            ),
          );
        },
      ),
    ),
  );
  Widget get bkashEndDower => const BkashEndDower();

  Widget get bkashButton => Builder(
    builder: (context) {
      return BkashMenuButton(
        onTap: () {
          Scaffold.of(context).openEndDrawer();
        },
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        systemNavigationBarColor: ThemeColors.primary,
        systemNavigationBarDividerColor: Colors.transparent,

        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        endDrawer: bkashEndDower,
        body: Stack(children: [banner, bkashButton, body, bottomBar]),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  _Body();
  Widget get bkashService => const BkashServiceContainer();
  Widget get suggestion => const SuggestionSection();
  Widget get offerSection => const OfferSection();
  Widget get otherServices => const OtherServicesSection();
  Widget get sizedBox => const SizedBox(height: 300);

  final List<OnboardingItem<OnboardingType, dynamic>> screenItem = [
    OnboardingItem<OnboardingType, dynamic>(type: .bkashService),
    OnboardingItem<OnboardingType, dynamic>(type: .suggestion),
    OnboardingItem<OnboardingType, dynamic>(type: .offerSection),
    OnboardingItem<OnboardingType, dynamic>(type: .otherServices),
    OnboardingItem<OnboardingType, dynamic>(type: .sizedBox),
  ];

  Widget _itemBuilder(OnboardingItem<OnboardingType, dynamic> type) {
    switch (type.type) {
      case .bkashService:
        return bkashService;
      case .suggestion:
        return suggestion;
      case .offerSection:
        return offerSection;
      case .otherServices:
        return otherServices;
      case .sizedBox:
        return sizedBox;
      // default:
      //   return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: screenItem.length, (
        context,
        index,
      ) {
        return RepaintBoundary(child: _itemBuilder(screenItem[index]));
      }),
    );
  }
}

enum OnboardingType {
  bkashService,
  suggestion,
  offerSection,
  otherServices,
  sizedBox,
}
