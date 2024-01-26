import 'package:flutter/cupertino.dart';

import '../theme/text_style.dart';

class EventSuccessDialog extends ChangeNotifier {
  Future<bool> eventSuccessDialog(BuildContext context, bool isSuccess) async {
    bool thisSuccess = isSuccess;

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
                thisSuccess = true;
                Navigator.pop(context);
                notifyListeners();
              },
            ),
            CupertinoDialogAction(
              child: const Text('취소하기', style: lightStyle),
              onPressed: () {
                thisSuccess = false;
                Navigator.pop(context);
                notifyListeners();
              },
            )
          ],
        );
      },
    );

    return thisSuccess;
  }
}