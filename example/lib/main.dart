import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Paypal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Paypal Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: TextButton(
              onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => UsePaypal(
                            sandboxMode: true,
                            clientId: "YOUR_CLIENT_ID",
                            secretKey: "YOUR_CLIENT_SECRET",
                            returnURL: "https://paypal.com",
                            cancelURL: "https://paypal.com",
                            transactions: const [
                              {
                                "amount": {
                                  "total": '1.99',
                                  "currency": "USD",
                                  "details": {
                                    "subtotal": '1.99',
                                    "shipping": '0',
                                    "shipping_discount": 0
                                  }
                                },
                                "description":
                                    "The payment transaction description.",
                                "payment_options": {
                                  "allowed_payment_method":
                                      "INSTANT_FUNDING_SOURCE"
                                },
                                "item_list": {
                                  "items": [
                                    {
                                      "name": "A demo product",
                                      "quantity": 1,
                                      "price": '1.99',
                                      "currency": "USD"
                                    }
                                  ],

                                  // shipping address is not required though
                                  "shipping_address": {
                                    "recipient_name": "Jane Foster",
                                    "line1": "Travis County",
                                    "line2": "",
                                    "city": "Austin",
                                    "country_code": "US",
                                    "postal_code": "73301",
                                    "phone": "+00000000",
                                    "state": "Texas"
                                  },
                                }
                              }
                            ],
                            note: "Contact us for any questions on your order.",
                            onFinish: (Map params) async {
                              print(params);
                              Navigator.pop(context);
                            },
                            onError: (error) {
                              print(error);
                            }),
                      ),
                    )
                  },
              child: const Text("Make Payment")),
        ));
  }
}