import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class Khalti extends StatelessWidget {
  Khalti({Key? key}) : super(key: key);

  final config = PaymentConfig(
    amount: 1000, // Amount should be in paisa
    productIdentity: 'dell-g5-g5510-2021',
    productName: 'Dell G5 G5510 2021',
    productUrl: 'https://www.khalti.com/#/bazaar',
    additionalData: {
      // Not mandatory; can be used for reporting purpose
      'vendor': 'Khalti Bazaar',
    }, // Not mandatory; makes the mobile field not editable
  );

  @override
  Widget build(BuildContext context) {
    return KhaltiButton(
      config: config,
      preferences: const [
        PaymentPreference.khalti,
        // Not providing this will enable all the payment methods.
      ],
      onSuccess: (successModel) {
        debugPrint("sucesssssssssss");
        debugPrint("successModel");
        // Perform Server Verification
      },
      onFailure: (failureModel) {
        debugPrint("failllllllllllllll");
        debugPrint(failureModel.message);
        // What to do on failure?
      },
      onCancel: () {
        // User manually cancelled the transaction
      },
    );
  }
}
