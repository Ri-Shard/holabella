import 'package:flutter/material.dart';
import 'package:holabella/ui/resources/my_theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingModal extends StatelessWidget {
  const LoadingModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: LoadingAnimationWidget.threeRotatingDots(
            color: MyTheme.verdeMenta, size: 50),
      ),
    );
  }
}
