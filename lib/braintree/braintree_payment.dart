import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

class BrainTreePayment extends StatelessWidget {
  // payment() async {
  //   final request = BraintreeDropInRequest(
  //     clientToken:
  //         'AXJXlKwvRDij-YykMTi4k8vy9ox9bp7uFHMgbuCvsrbP4pZKJZMp9AVxwpNwu-i2eeDCtuOre_yTmN3M',
  //     collectDeviceData: true,
  //     googlePaymentRequest: BraintreeGooglePaymentRequest(
  //       totalPrice: '1.00',
  //       //   currencyCode: 'USD',
  //       currencyCode: 'INR',
  //       billingAddressRequired: false,
  //     ),
  //     paypalRequest: BraintreePayPalRequest(
  //       amount: '1.00',
  //       displayName: 'SixteenBrains',
  //     ),
  //   );
  //   BraintreeDropInResult result = await BraintreeDropIn.start(request);
  //   if (result != null) {
  //     print('Nonce: ${result.paymentMethodNonce.nonce}');
  //   } else {
  //     print('Selection was canceled.');
  //   }
  // }

  // Future<void> payment() async {
  //   final request = BraintreePayPalRequest(amount: '1.00');
  //   BraintreePaymentMethodNonce result = await Braintree.requestPaypalNonce(
  //     'sandbox_mfwz9tg2_ksptt2gxdnw7bscb',
  //     request,
  //   );
  //   if (result != null) {
  //     print('Nonce: ${result.nonce}');
  //   } else {
  //     print('PayPal flow was canceled.');
  //   }
  // }

  Future<void> payment() async {
    var request = BraintreeDropInRequest(
      tokenizationKey: 'sandbox_mfwz9tg2_ksptt2gxdnw7bscb',
      collectDeviceData: true,
      paypalRequest: BraintreePayPalRequest(
        amount: '1.00',
        displayName: 'SixteenBrains',
        currencyCode: 'INR',
      ),
    );
    BraintreeDropInResult result = await BraintreeDropIn.start(request);
    if (result != null) {
      print(result.paymentMethodNonce.description);
      print(result.paymentMethodNonce.nonce);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BrainTree Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: payment,
          child: Text('Payment'),
        ),
      ),
    );
  }
}
