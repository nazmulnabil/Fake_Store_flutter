import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 34,
        width: 34,
        child: CircularProgressIndicator(strokeWidth: 3.5),
      ),
    );
  }
}
