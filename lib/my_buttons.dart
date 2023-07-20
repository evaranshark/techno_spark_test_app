import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'content_model.dart';

// It would be a good decision to define buttons callbacks as fields for more complicated cases
class MyButtons extends StatelessWidget {
  const MyButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<ContentModel>();
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  provider.setText(0);
                },
                child: const Text(
                  "Text 1",
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  provider.setText(1);
                },
                child: const Text("Text 2")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  provider.setImage();
                },
                child: const Text("Image")),
          ),
        ],
      ),
    );
  }
}
