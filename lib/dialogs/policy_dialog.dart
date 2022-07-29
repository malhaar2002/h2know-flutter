import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PolicyDialog extends StatelessWidget {
  const PolicyDialog({
    super.key,
    this.radius = 8,
    required this.mdFileName,
  });
  final double radius;
  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 500)).then((value) => rootBundle.load('assets/legal/$mdFileName')),
              builder: (context, snapshot) {
                final buffer = snapshot.data!.buffer;
                var list = buffer.asUint8List(snapshot.data!.offsetInBytes, snapshot.data!.lengthInBytes);
                String data = utf8.decode(list);
                if (snapshot.hasData) {
                return Markdown(
                  data: data,
                );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
