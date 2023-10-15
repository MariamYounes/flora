import 'package:flutter_easyloading/flutter_easyloading.dart';


void showError(txt) {
  EasyLoading.showToast(
    txt,
    duration: const Duration(seconds: 3),
    toastPosition: EasyLoadingToastPosition.center,
  );
}

void showSuccess(txt) {
  EasyLoading.showToast(
    txt,
    duration: const Duration(seconds: 3),
    toastPosition: EasyLoadingToastPosition.center,
  );
}

showToastMsgList(List<String> errorMessages) {
  for (var errorMessage in errorMessages) {
    EasyLoading.showToast(
      errorMessage,
      duration: const Duration(seconds: 3),
      toastPosition: EasyLoadingToastPosition.center,
    );
  }
}

