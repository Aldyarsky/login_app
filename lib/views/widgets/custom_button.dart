import 'package:flutter/cupertino.dart';
import 'package:login_app/views/style/app_colors.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.padding,
  });

  final String title;
  final EdgeInsets? padding;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      child: Container(
        width: 100.w,
        padding: padding ?? const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Text(
          title,
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
