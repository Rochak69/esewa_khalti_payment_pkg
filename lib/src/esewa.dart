import 'package:esewa_pnp/esewa.dart';
import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/material.dart';

class Esewa extends StatelessWidget {
  Esewa(
      {Key? key,
      required this.products,
      required this.clientID,
      required this.secretKey})
      : super(key: key);
  Map<String, Object> products;
  String clientID, secretKey;

  @override
  Widget build(BuildContext context) {
    _initPayment(Map<String, dynamic> products) async {
      ESewaConfiguration _configuration = ESewaConfiguration(
          clientID: clientID,
          secretKey: secretKey,
          environment: ESewaConfiguration.ENVIRONMENT_TEST //ENVIRONMENT_LIVE
          );
      ESewaPnp _eSewaPnp = ESewaPnp(configuration: _configuration);

      ESewaPayment _payment = ESewaPayment(
          amount: products["amount"],
          productName: products["name"],
          productID: products["id"],
          callBackURL: "http://example.com");
      try {
        final _res = await _eSewaPnp.initPayment(payment: _payment);
        debugPrint("Sucessful payment");
      } on ESewaPaymentException catch (e) {
        debugPrint("rorror in payment");
      }
    }

    ESewaPnp _eSewaPnp = ESewaPnp(
        configuration: ESewaConfiguration(
            clientID: clientID,
            secretKey: secretKey,
            environment: ESewaConfiguration.ENVIRONMENT_TEST));

    return ESewaPaymentButton(_eSewaPnp,
        amount: 1,
        productId: "this",
        productName: "that",
        callBackURL: "example.com", onSuccess: (w) {
      debugPrint("assa");
    }, onFailure: (w) {
      debugPrint(w.message);
    });
  }
}
