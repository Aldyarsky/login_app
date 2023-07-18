import 'package:flutter/cupertino.dart';
import 'package:login_app/views/style/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.padding,
    this.backgroundColor,
    this.placeholder,
    this.placeholderStyle,
    this.obscureText = false,
    this.validationMessage,
  });

  final TextEditingController? controller;
  final EdgeInsets? padding;
  final bool obscureText;
  final Color? backgroundColor;
  final String? placeholder;
  final TextStyle? placeholderStyle;
  final String? validationMessage;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscureText;
  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor ?? AppColors.whiteBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoTextField.borderless(
            controller: widget.controller,
            padding: widget.padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            placeholder: widget.placeholder,
            suffix: widget.obscureText
                ? CupertinoButton(
                    child: obscureText
                        ? const Icon(CupertinoIcons.eye_slash)
                        : const Icon(CupertinoIcons.eye),
                    onPressed: () {
                      setState(
                        () {
                          obscureText = !obscureText;
                        },
                      );
                    },
                  )
                : null,
            placeholderStyle: widget.placeholderStyle ??
                CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      color: AppColors.gray,
                      fontWeight: FontWeight.w400,
                    ),
            obscureText: obscureText,
            decoration: BoxDecoration(
                color: widget.backgroundColor ?? AppColors.whiteBg),
          ),
          ...[
            if (widget.validationMessage != null)
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widget.padding?.horizontal ?? 16),
                child: Text(
                  widget.validationMessage!,
                  style:
                      CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            color: CupertinoColors.systemRed,
                          ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
