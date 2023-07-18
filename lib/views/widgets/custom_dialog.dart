import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.message,
    required this.isError,
  });
  final String message;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(isError
          ? '${AppLocalizations.of(context)!.error}!'
          : '${AppLocalizations.of(context)!.success}!'),
      content: Column(
        children: [
          Text(message),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CupertinoButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        )
      ],
    );
  }
}

Future<void> showCustomDialog(
    String message, bool isError, BuildContext context) {
  return showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return CustomDialog(
        message: message,
        isError: isError,
      );
    },
  );
}
