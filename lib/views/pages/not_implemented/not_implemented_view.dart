import 'package:flutter/cupertino.dart';
import 'package:login_app/views/style/app_colors.dart';

class NotImplementedView extends StatelessWidget {
  const NotImplementedView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Text(
          'This screen is not implemented yet...',
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                color: AppColors.gray,
              ),
        ),
      ),
    );
  }
}
