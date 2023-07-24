import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class BrgImageSelectorWidget extends StatefulWidget {
  final List<String>? urlList;
  final double horizontalPadding;
  final int crossAxisCount;
  final Function(int selectedItemIndex) onSelected;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double? width;
  final double? height;

  const BrgImageSelectorWidget._({
    Key? key,
    required this.horizontalPadding,
    required this.crossAxisCount,
    required this.onSelected,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
    this.urlList,
    this.width,
    this.height,
  }) : super(key: key);

  factory BrgImageSelectorWidget.network({
    required List<String> urlList,
    required Function(int selectedItemIndex) onSelected,
    double horizontalPadding = 16,
    int crossAxisCount = 3,
    double mainAxisSpacing = 8,
    double crossAxisSpacing = 8,
    double? width,
    double? height,
  }) =>
      BrgImageSelectorWidget._(
        urlList: urlList,
        onSelected: onSelected,
        horizontalPadding: horizontalPadding,
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        width: width,
        height: height,
      );

  @override
  State<BrgImageSelectorWidget> createState() => _BrgImageSelectorWidgetState();
}

class _BrgImageSelectorWidgetState extends State<BrgImageSelectorWidget> {
  int? selectedItemIndex;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final width = deviceSize.width - widget.horizontalPadding * 2;

    return SizedBox(
      width: width,
      height: width,
      child: GridView.count(
        primary: false,
        mainAxisSpacing: widget.mainAxisSpacing,
        crossAxisSpacing: widget.crossAxisSpacing,
        crossAxisCount: widget.crossAxisCount,
        children: widget.urlList == null
            ? []
            : widget.urlList!.mapIndexed((index, url) => _buildNetworkImageWithSelectionBorder(index, url)).toList(),
      ),
    );
  }

  Widget _buildNetworkImageWithSelectionBorder(int itemIndex, String url) {
    return itemIndex == selectedItemIndex
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent, width: 3),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: _buildNetworkImageCard(itemIndex, url),
          )
        : _buildNetworkImageCard(itemIndex, url);
  }

  Widget _buildNetworkImageCard(int itemIndex, String url) {
    return Card(
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          onTap: () {
            if (selectedItemIndex != itemIndex) {
              widget.onSelected(itemIndex);
              setState(() => selectedItemIndex = itemIndex);
            }
          },
          child: Image.network(
            url,
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
