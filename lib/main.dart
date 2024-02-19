import 'package:flutter/material.dart';

import 'facebook_app_events.dart';

void main() {
  runApp(const MyApp());
}
//add

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final facebookAppEvents = FacebookAppEvents();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: facebookAppEvents.getAnonymousId(),
                builder: (context, snapshot) {
                  final id = snapshot.data ?? '???';
                  return Text('Anonymous ID: $id');
                },
              ),
              MaterialButton(
                child: const Text("new_Button!"),
                onPressed: () {
                  facebookAppEvents.logEvent(
                    name: 'new_button',
                    parameters: {
                      'button_id': 'the_clickme_button',
                    },
                  );
                },
              ),
              MaterialButton(
                child: const Text("Set user data"),
                onPressed: () {
                  facebookAppEvents.setUserData(
                    email: 'opensource@oddbit.id',
                    firstName: 'Oddbit',
                    dateOfBirth: '2019-10-19',
                    city: 'Denpasar',
                    country: 'Indonesia',
                  );
                },
              ),
              MaterialButton(
                child: const Text("Test logAddToCart"),
                onPressed: () {
                  facebookAppEvents.logAddToCart(
                    id: '1',
                    type: 'product',
                    price: 99.0,
                    currency: 'TRY',

                  );
                   facebookAppEvents.logEvent(
                    name: 'logAddToCart',
                    parameters: {
                      "Authorization":"Bearer eyaASesioacszxsoghkoGGG5534",
                      'button_id': 'logAddToCartTestButton',
                    },
                  );
                },
              ),
              MaterialButton(
                child: const Text("Test purchase!"),
                onPressed: () {
                  facebookAppEvents.logPurchase(amount: 1, currency: "USD");
                  facebookAppEvents.logSubscribe(orderId: "KTest",);
                },
              ),
              MaterialButton(
                child: const Text("Enable advertise tracking!"),
                onPressed: () {
                  facebookAppEvents.setAdvertiserTracking(enabled: true);
                },
              ),
              MaterialButton(
                child: const Text("Disabled advertise tracking!"),
                onPressed: () {
                  facebookAppEvents.setAdvertiserTracking(enabled: false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
