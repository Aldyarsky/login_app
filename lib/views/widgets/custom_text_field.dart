import 'package:flutter/cupertino.dart';
import 'package:login_app/views/style/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.padding,
    this.backgroundColor,
    this.placeholder,
  });

  final TextEditingController? controller;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField.borderless(
      controller: controller,
      padding: padding ?? const EdgeInsets.all(16),
      placeholder: placeholder,
      decoration: BoxDecoration(color: backgroundColor ?? AppColors.whiteBg),
    );
  }
}
