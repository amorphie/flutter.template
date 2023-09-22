import 'package:burgan_ui/components/burgan_components.dart';
import 'package:burgankuwait/core/reusable_widgets/navigation_button/navigation_button.dart';
import 'package:burgankuwait/core/reusable_widgets/sub_navigation/models/sub_navigation_component_details.dart';
import 'package:flutter/material.dart';

class SubNavigationWidget extends StatelessWidget {
  final List<SubNavigationComponentDetails> componentDetailsList;

  const SubNavigationWidget({Key? key, required this.componentDetailsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            ...componentDetailsList.map((e) => _buildNavigationItemRow(e, context)),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItemRow(SubNavigationComponentDetails componentDetails, BuildContext context) {
    return NavigationButton(
      navigationType: componentDetails.navigationType,
      navigationPath: componentDetails.navigateTo,
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
                componentDetails.displayName,
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
