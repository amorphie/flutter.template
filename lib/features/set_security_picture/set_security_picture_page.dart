import 'package:burgan_poc/core/dependency_injection/dependency_injection.dart';
import 'package:burgan_poc/core/localization/localizable_text.dart';
import 'package:burgan_poc/core/navigation/navigation_helper.dart';
import 'package:burgan_poc/core/navigation/navigation_type.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_button/brg_button.dart';
import 'package:burgan_poc/core/reusable_widgets/brg_image_selector/brg_image_selector_widget.dart';
import 'package:burgan_poc/core/reusable_widgets/security_icon_widget/security_icon_widget.dart';
import 'package:burgan_poc/core/util/app_constants.dart';
import 'package:burgan_poc/core/util/extensions/widget_extensions.dart';
import 'package:burgan_poc/features/login/login_page_route.dart';
import 'package:burgan_poc/features/terms_and_conditions/terms_and_conditions_page_route.dart';
import 'package:flutter/material.dart';

class SetSecurityPicturePage extends StatelessWidget {
  const SetSecurityPicturePage({Key? key}) : super(key: key);

  // TODO: Get url list from api response
  static const _securityImageUrlList = [
    "https://cdn.pixabay.com/photo/2015/11/19/21/11/book-1052014_1280.jpg",
    "https://cdn.pixabay.com/photo/2014/09/14/18/04/dandelion-445228_1280.jpg",
    "https://cdn.pixabay.com/photo/2022/03/09/21/40/song-7058726_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/08/11/23/48/mountains-1587287_1280.jpg",
    "https://cdn.pixabay.com/photo/2014/10/22/18/04/man-498473_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/10/27/22/52/apples-1776744_1280.jpg",
    "https://cdn.pixabay.com/photo/2017/01/04/21/00/fireworks-1953253_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/06/06/21/53/child-1440526_1280.jpg",
    "https://cdn.pixabay.com/photo/2015/09/08/21/02/superbike-930715_1280.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - AppConstants.appBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              _buildTitleText(),
              _buildDescriptionText(),
              _buildImageSelectorWidget(),
              _buildContinueButton(context),
              const Spacer(),
              const SecurityIconWidget(),
            ],
          ).paddingHorizontal(32),
        ),
      ),
    );
  }

  BrgAppBar _buildAppBar(BuildContext context) {
    return BrgAppBar(
      title: Center(
        child: Text(
          const LocalizableText(tr: "Güvenlik", en: "Security").localize(),
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
        ).padding(right: 48),
      ),
    );
  }

  Widget _buildTitleText() => Text(
        const LocalizableText(tr: "Güvenlik Resmini Seçin", en: "Select Security Image").localize(),
        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      );

  Widget _buildDescriptionText() => const Row(
        children: [
          Flexible(
            child: Text(
              "İnternet Bankacılığına giriş yaparken doğrulayacağınız görseli aşağıdan seçebilirsiniz.",
            ),
          ),
        ],
      ).paddingVertical(8);

  Widget _buildImageSelectorWidget() {
    return BrgImageSelectorWidget.network(
      urlList: _securityImageUrlList,
      onSelected: (index) {
        // TODO: Set selected item index
      },
    ).padding(top: 32);
  }

  Widget _buildContinueButton(BuildContext context) {
    return BrgButton(
      text: const LocalizableText(tr: "Devam", en: "Continue").localize(),
      onPressed: () {
        // TODO: Validate security picture selection
        // TODO: Navigate to set question picture page with signalR event
        getIt.get<NavigationHelper>().navigate(
              context: context,
              navigationType: NavigationType.go,
              path: "/${LoginPageRoute.path}/${TermsAndConditionsRoute.path}",
            );
      },
    ).padding(top: 16);
  }
}
