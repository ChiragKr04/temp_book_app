import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// ShimmerListView is widget which gets shown when data is being fetched from api.
/// It shows shimmer effect on the list view for better user experience.
class ShimmerListView extends StatefulWidget {
  const ShimmerListView({super.key});

  @override
  State createState() => _ShimmerListViewState();
}

class _ShimmerListViewState extends State<ShimmerListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        controller: ScrollController(),
        physics: const PageScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildShimmerItem();
        },
      ),
    );
  }

  Widget _buildShimmerItem() {
    return SizedBox(
      width: 150,
      height: 200,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        child: Container(
          width: 150,
          height: 200,
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
