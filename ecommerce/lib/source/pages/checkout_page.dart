import 'package:ecommerce/source/model/product.dart';
import 'package:ecommerce/source/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final List<Product> cartList; // Pass cart data from ShoppingCartPage

  const CheckoutPage({Key? key, required this.cartList}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _name = '';
  String _address = '';
  String _email = '';
  String? _selectedPaymentMethod;
  List<String> _paymentMethodItems = ['Credit Card', 'PayPal', 'Cash', 'VNpay'];

  void _submitOrder() {
    if (_name.isEmpty ||
        _address.isEmpty ||
        _email.isEmpty ||
        _selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please provide all required information'),
      ));
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Order submitted successfully!'),
    ));

    Navigator.pop(context); // Navigate back to ShoppingCartPage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.blue, // Màu nền cho thanh AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _name = value),
            ),
            const SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Shipping Address',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _address = value),
            ),
            const SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _email = value),
            ),
            const SizedBox(height: 20.0),

            DropdownButtonFormField<String>(
              value: _selectedPaymentMethod,
              items: _paymentMethodItems.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) =>
                  setState(() => _selectedPaymentMethod = value),
              decoration: InputDecoration(
                labelText: 'Payment Method',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20.0),

            // Phần tổng kết đơn hàng
            Text(
              'Order Summary',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black), 
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.cartList.length,
              itemBuilder: (context, index) {
                final product = widget.cartList[index];
                return ListTile(
                  title: Text(product.name,
                      style: TextStyle(
                          color: Colors.black)), 
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Colors.black)), 
                );
              },
            ),
            const SizedBox(height: 10),
            Text(
              'Total: \$${calculateTotal(widget.cartList).toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black), 
            ),

            ElevatedButton(
              onPressed: _submitOrder,
              child: const Text('Submit Order'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, 
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateTotal(List<Product> cartList) {
    double total = 0;
    for (var product in cartList) {
      total += product.price;
    }
    return total;
  }
}
