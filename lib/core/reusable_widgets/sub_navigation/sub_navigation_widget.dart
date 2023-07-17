import 'package:burgan_poc/core/dependency_injection/dependency_injection.dart';
import 'package:burgan_poc/core/navigation/navigation_helper.dart';
import 'package:burgan_poc/core/reusable_widgets/new_badge/new_badge_widget.dart';
import 'package:burgan_poc/core/reusable_widgets/sub_navigation/bloc/sub_navigation_widget_bloc.dart';
import 'package:burgan_poc/core/reusable_widgets/sub_navigation/models/sub_navigation_component_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubNavigationWidget extends StatelessWidget {
  const SubNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocProvider<SubNavigationWidgetBloc>(
        create: (context) => SubNavigationWidgetBloc()..add(SubNavigationWidgetEventFetchComponentDetails()),
        child: BlocBuilder<SubNavigationWidgetBloc, SubNavigationWidgetState>(
          builder: (context, state) {
            switch (state) {
              case SubNavigationWidgetStateLoading _:
                return _buildLoading();
              case SubNavigationWidgetStateLoaded _:
                return _buildComponents(state.componentDetailsList, context);
            }
          },
        ),
      ),
    );
  }

  // TODO: Display skeleton loading
  Widget _buildLoading() => const SizedBox(height: 180, child: Center(child: CircularProgressIndicator()));

  Widget _buildComponents(List<SubNavigationComponentDetails> componentDetailsList, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          ...componentDetailsList.map((e) => _buildNavigationItemRow(e, context)),
        ],
      ),
    );
  }

  Widget _buildNavigationItemRow(SubNavigationComponentDetails componentDetails, BuildContext context) {
    return GestureDetector(
      onTap: () => getIt.get<NavigationHelper>().navigate(
            context: context,
            navigationType: componentDetails.navigationType,
            path: componentDetails.navigateTo,
          ),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                componentDetails.displayName?.localize(context) ?? '',
                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    if (componentDetails.displayNewBadge)
                      const Padding(
                        padding: EdgeInsets.only(right: 4.0),
                        child: NewBadgeWidget(),
                      ),
                    const Icon(Icons.arrow_forward_ios_rounded, size: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
