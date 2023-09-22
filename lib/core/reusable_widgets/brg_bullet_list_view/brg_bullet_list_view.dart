import 'package:burgan_core/burgan_core.dart';
import 'package:flutter/material.dart';

class BrgBulletListView extends StatelessWidget {
  final List<String> bulletList;

  const BrgBulletListView({Key? key, required this.bulletList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...bulletList.map((e) => _buildBulletItemRow(e)).toList()],
    );
  }

  Widget _buildBulletItemRow(String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.circle, size: 6).padding(top: 4, right: 4),
        Flexible(child: Text(description, maxLines: 3)),
      ],
    ).paddingVertical(4);
  }
}
