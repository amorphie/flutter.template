import 'package:burgankuwait/core/models/brg_workflow.dart';
import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgankuwait/core/widgets/brg_component_tree_builder/brg_component_tree_builder.dart';
import 'package:burgankuwait/features/otp/bloc/otp_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpPage extends StatefulWidget {
  final BrgWorkflow workflow;
  final String pageId;

  const OtpPage({Key? key, required this.workflow, required this.pageId}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrgAppBar(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: BlocConsumer<OtpPageBloc, OtpPageState>(
              listener: (context, state) {
                if (state is OtpPageStateInitial && state.navigationPath != null) {
                  _handleNavigation(context, state.navigationPath!);
                }
              },
              builder: (context, state) {
                return BrgComponentTreeBuilder(pageId: widget.pageId);
              },
            ),
          )
        ],
      ),
    );
  }

  void _handleNavigation(BuildContext context, String navigationPath) {
    NavigationHelper().navigate(
      context: context,
      navigationType: NavigationType.pushReplacement,
      path: navigationPath,
    );
  }
}
