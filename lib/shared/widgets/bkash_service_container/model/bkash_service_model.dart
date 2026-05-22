import 'package:bkashclone/core/assets/service_svg_assets.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:flutter/material.dart';

class BkashServiceModel {
  final String svg;
  final String title;

  BkashServiceModel({required this.svg, required this.title});
}

class ServicesData {
  ServicesData._();
  static List<BkashServiceModel> list(BuildContext context) {
    final l10n = context.l10n;
    return [
      BkashServiceModel(
        svg: ServiceSvgAssets.sendMoney,
        title: l10n.send_money,
      ),
      BkashServiceModel(
        svg: ServiceSvgAssets.mobileRecharge,
        title: l10n.mobile_recharge,
      ),
      BkashServiceModel(svg: ServiceSvgAssets.cashOut, title: l10n.cash_out),
      BkashServiceModel(svg: ServiceSvgAssets.payment, title: l10n.payment),
      BkashServiceModel(svg: ServiceSvgAssets.addMoney, title: l10n.add_money),
      BkashServiceModel(svg: ServiceSvgAssets.payBill, title: l10n.pay_bill),
      BkashServiceModel(svg: ServiceSvgAssets.savings, title: l10n.savings),
      BkashServiceModel(svg: ServiceSvgAssets.loan, title: l10n.loan),
      BkashServiceModel(svg: ServiceSvgAssets.insurance, title: l10n.insurance),
      BkashServiceModel(
        svg: ServiceSvgAssets.bkashtoBank,
        title: l10n.bkash_to_bank,
      ),
      BkashServiceModel(
        svg: ServiceSvgAssets.educationFee,
        title: l10n.education_fee,
      ),
      BkashServiceModel(
        svg: ServiceSvgAssets.microfinance,
        title: l10n.microfinance,
      ),
      BkashServiceModel(svg: ServiceSvgAssets.toll, title: l10n.toll),
      BkashServiceModel(
        svg: ServiceSvgAssets.requestMoney,
        title: l10n.request_money,
      ),
      BkashServiceModel(
        svg: ServiceSvgAssets.remitance,
        title: l10n.remittance,
      ),
      BkashServiceModel(svg: ServiceSvgAssets.donation, title: l10n.donation),
    ];
  }
}
