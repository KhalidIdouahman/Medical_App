import 'package:flutter/material.dart';
import 'package:medical_app_final/constants/constants.dart';
import 'package:medical_app_final/models/item.dart';

class ItemsOfDashboard extends StatelessWidget {
  final Item item;
  final VoidCallback press;

  const ItemsOfDashboard({Key? key, required this.item, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            height: 175,
            width: 160,
            decoration: BoxDecoration(
              color: kCardBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Image.asset(
                  item.img,
                  height: 90,
                  // width: 90,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    item.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}