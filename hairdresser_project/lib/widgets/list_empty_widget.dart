import 'package:flutter/material.dart';

class ListEmptyWidget extends StatelessWidget {
  const ListEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Column(
      children: [
        //CustomImageFetcher(imageUrl: imageUrl),
        Text("liste boş"),
      ],
    ));
  }
}
