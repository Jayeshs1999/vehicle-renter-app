import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({Key? key}) : super(key: key);

  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var Products_on_the_cart = [
    {
      "name": "BMW X1         ",
      "picture": "images/cars/rent_cars/hondajazz.jpeg",
      "price": "Available",
      "color": "red"
    },
    {
      "name": "Honda SP-125",
      "picture": "images/rent_bikes/hondasp125.jpg",
      "price": "Available",
      "color": "black"
    },
    {
      "name": "Hero lectra",
      "picture": "images/rent_cycle/herolectro.jpg",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Honda HR-V",
      "picture": "images/cars/rent_cars/hondahrv.jpg",
      "old_price": "",
      "price": "Available",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_picture: Products_on_the_cart[index]["picture"],
            cart_prod_price: Products_on_the_cart[index]["price"],
            cart_prod_color: Products_on_the_cart[index]["color"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      this.cart_prod_color,
      this.cart_prod_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //=================================LEADING SECTIOM================================
        leading: Image.asset(
          cart_prod_picture,
          width: 80,
          height: 80,
        ),

        //=========================TITLE SECTION=======================================

        title: Text(cart_prod_name),

        //=====================SUBTITLE SECTION============================
        subtitle: Column(
          children: [
            //==================ROW INSIDE COLUMN===============
            Row(
              children: [
                //this section is for the color of product
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Color :",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${cart_prod_color}",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),

            //=============================this section is for the product price==================
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "\$${cart_prod_price}",
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ),
          ],
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 0),
          child: FittedBox(
            fit: BoxFit.none,
            child: Column(
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_drop_up),
                ),
                Text("${cart_prod_qty}"),
                MaterialButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.arrow_drop_down,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
