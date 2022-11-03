import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class Khalti extends StatelessWidget {
  Khalti({Key? key, required this.config}) : super(key: key);

  PaymentConfig config;

  @override
  Widget build(BuildContext context) {
    return KhaltiButton(
      config: config,
      preferences: const [
        PaymentPreference.khalti,
        // Not providing this will enable all the payment methods.
      ],
      onSuccess: (successModel) {
        debugPrint("222");
        debugPrint("222");
        // Perform Server Verification
      },
      onFailure: (failureModel) {
        debugPrint("33");
        debugPrint(failureModel.message);
        // What to do on failure?
      },
      onCancel: () {
        // User manually cancelled the transaction
      },
    );
  }
}
