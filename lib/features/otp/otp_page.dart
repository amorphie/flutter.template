import 'package:burgankuwait/core/models/brg_workflow.dart';
import 'package:burgankuwait/core/navigation/navigation_helper.dart';
import 'package:burgankuwait/core/navigation/navigation_type.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgankuwait/features/otp/bloc/otp_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class OtpPage extends StatefulWidget {
  final BrgWorkflow workflow;

  const OtpPage({Key? key, required this.workflow}) : super(key: key);

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
                switch (state) {
                  case OtpPageStateLoading _:
                    return const Center(child: CircularProgressIndicator());
                  case OtpPageStateLoaded _:
                    return JsonWidgetData.fromDynamic(state.componentsMap)?.build(
                          context: context,
                        ) ??
                        const SizedBox.shrink();
                  default:
                    return const SizedBox.shrink();
                }
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
