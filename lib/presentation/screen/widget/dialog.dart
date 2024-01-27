import 'package:flutter/cupertino.dart';

import '../theme/text_style.dart';

class EventSuccessDialog {
  Future<void> eventSuccessDialog(BuildContext context,
      {required Function(bool isSuccess) onResult}) async {
    await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('완료하기', style: boldStyle),
          content: const Text('할 일을 완료하시겠습니까?', style: lightStyle),
          actions: [
            CupertinoDialogAction(
              child: const Text('완료하기', style: mediumStyle),
              onPressed: () {
                onResult.call(true);
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: const Text('취소하기', style: lightStyle),
              onPressed: () {
                onResult.call(false);
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
