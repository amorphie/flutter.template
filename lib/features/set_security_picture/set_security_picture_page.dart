import 'package:burgan_core/burgan_core.dart';
import 'package:burgankuwait/core/localization/localizable_text.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgankuwait/core/widgets/brg_component_tree_builder/brg_component_tree_builder.dart';
import 'package:burgankuwait/features/set_security_picture/bloc/set_security_picture_bloc.dart';
import 'package:burgankuwait/features/set_security_picture/set_security_picture_page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetSecurityPicturePage extends StatelessWidget {
  const SetSecurityPicturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: BlocBuilder<SetSecurityPictureBloc, SetSecurityPictureState>(
              builder: (context, state) {
                return const BrgComponentTreeBuilder(pageId: SetSecurityPicturePageRoute.path);
              },
            ),
          )
        ],
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
}
