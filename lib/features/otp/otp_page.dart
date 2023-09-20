import 'package:burgankuwait/core/models/brg_workflow.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_app_bar/brg_app_bar.dart';
import 'package:burgankuwait/core/widgets/brg_component_tree_builder/brg_component_tree_builder.dart';
import 'package:flutter/material.dart';

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
            child: BrgComponentTreeBuilder(pageId: widget.pageId),
          )
        ],
      ),
    );
  }
}
