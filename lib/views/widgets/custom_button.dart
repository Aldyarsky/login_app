import 'package:flutter/cupertino.dart';
import 'package:login_app/views/style/app_colors.dart';

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
    return Row(
      children: [
        Expanded(
          child: CupertinoButton.filled(
            onPressed: onPressed,
            padding: padding ?? const EdgeInsets.all(16),
            child: Text(
              title,
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
