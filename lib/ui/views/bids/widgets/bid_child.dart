import 'package:beba_driver/ui/views/widgets/order_container_widget.dart';
import 'package:flutter/material.dart';

class BidChildView extends StatelessWidget {
  final String bidType;
  const BidChildView({super.key, required this.bidType});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return OrderContainerWidget(
                    bidType: bidType,
                    isMatched: false,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
