import 'package:burgan_core/burgan_core.dart';
import 'package:burgan_ui/components/burgan_components.dart';
import 'package:burgankuwait/core/models/brg_workflow.dart';
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
            child: BrgComponentTreeBuilder(
              componentsNetworkManager: context.read<OtpPageBloc>().componentsNetworkManager,
              pageId: widget.pageId,
            ),
          )
        ],
      ),
    );
  }
}
