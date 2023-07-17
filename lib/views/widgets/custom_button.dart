import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      child: Container(
          width: 100.w, alignment: Alignment.center, child: Text(title)),
    );
  }
}
