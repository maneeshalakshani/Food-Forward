import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_forward/models/CartItem.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/auth_state.dart';
import 'package:food_forward/services/authentication.dart';
import 'package:food_forward/services/recipient/recipientSerices.dart';

class PaymentDrawerView extends StatefulWidget {
  // final Function(String cardNumber, String expiration, String cvv) onPaymentComplete;
  final Function(String cardNumber, String expiration, String cvv) onPaymentComplete;

  PaymentDrawerView({required this.onPaymentComplete, required this.context, required this.authStore, required this.cartItems});
  final BuildContext context;
  final List<CartItem> cartItems;
  final AuthStore authStore;

  @override
  _PaymentDrawerViewState createState() => _PaymentDrawerViewState();
}

class _PaymentDrawerViewState extends State<PaymentDrawerView> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expirationController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isCardNumberValid = false;
  bool isExpirationValid = false;
  bool isCvvValid = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: const Text(
                  "Enter Card Details",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 121, 32, 26),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: cardNumberController,
                  keyboardType: TextInputType.number, // Allow only numeric input
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CardNumberInputFormatter(),
                  ],
                  decoration: InputDecoration(
                    labelText: "Card Number",
                    suffixIcon: isCardNumberValid
                        ? Icon(Icons.check, color: Colors.green)
                        : null,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      isCardNumberValid = false;
                      return 'Please enter a valid card number';
                    }
                    if (!RegExp(r'^\d{4} \d{4} \d{4} \d{4}$').hasMatch(value)) {
                      isCardNumberValid = false;
                      return 'Card number must be 16 digits with spaces';
                    }
                    isCardNumberValid = true;
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: expirationController,
                  keyboardType: TextInputType.number, // Allow only numeric input
                  decoration: InputDecoration(
                    labelText: "Expiration Date (MM/YY)",
                    suffixIcon: isExpirationValid
                        ? Icon(Icons.check, color: Colors.green)
                        : null,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      isExpirationValid = false;
                      return 'Please enter a valid expiration date';
                    }
                    if (!RegExp(r'^\d{2}\/\d{2}$').hasMatch(value)) {
                      isExpirationValid = false;
                      return 'Date should be in DD/MM format';
                    }
                    isExpirationValid = true;
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: cvvController,
                  keyboardType: TextInputType.number, // Allow only numeric input
                  decoration: InputDecoration(
                    labelText: "CVV",
                    suffixIcon: isCvvValid
                        ? Icon(Icons.check, color: Colors.green)
                        : null,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      isCvvValid = false;
                      return 'Please enter a valid CVV';
                    }
                    if (!RegExp(r'^\d{3}$').hasMatch(value)) {
                      isCvvValid = false;
                      return 'CVV must be 3 digits';
                    }
                    isCvvValid = true;
                    return null;
                  },
                ),
              ),
              SquareButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final cardNumber = cardNumberController.text.replaceAll(" ", "");
                    final expiration = expirationController.text;
                    final cvv = cvvController.text;

                    widget.onPaymentComplete(cardNumber, expiration, cvv);

                    Navigator.of(context).pop(); //back

                    RecipientFunction().createOrder(
                      userId: Authentications().getCurrentUserId(), 
                      cartItems: widget.cartItems, 
                      context: widget.context, 
                      route: OrderConfirmRoute(orderNo: "afc7687JJe3", authStore: widget.authStore),
                    );
                  }
                },
                text: "Complete Payment",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final StringBuffer newText = StringBuffer();
    final List<String> digits = newValue.text.replaceAll(' ', '').split('');

    for (int i = 0; i < digits.length; i++) {
      if (i > 0 && i % 4 == 0) {
        newText.write(' ');
      }
      newText.write(digits[i]);
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
