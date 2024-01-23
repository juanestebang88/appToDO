import 'package:flutter/material.dart';

class ProcessIndicatorCustom extends StatelessWidget {
  const ProcessIndicatorCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 50.0 ),
        width: MediaQuery.of(context).size.width *0.85,
        height: 50.0,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurple,
          ),
        ),
      );
  }
}
