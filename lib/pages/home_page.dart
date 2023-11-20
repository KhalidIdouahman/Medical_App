import 'package:flutter/material.dart';
import 'package:medical_app_final/constants/constants.dart';
import 'package:medical_app_final/models/item.dart';
import 'package:medical_app_final/pages/details_page.dart';
import 'package:medical_app_final/widgets/dashboard_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const NavBar(),
      backgroundColor: kAppColor,
      // i surround my column with the builder widget for the drawer to work , because we need a context inside
      // the scaffold to work .
      body: Builder(builder: (context) {
        return Column(
          children: <Widget>[
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          child: ClipOval(
                            child: Image.asset(
                              'images/girl.jpg',
                              height: 90,
                              // width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // radius: 25,
                        ),
                      ),

                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // he applies google fonts .
                          Text(
                            "Hey!! Welcome",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "nasima alaoui",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: kCardBgColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      alignment: Alignment.center,
                      icon: const Icon(Icons.sort_rounded,
                          size: 32, color: Colors.white),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // this property for the space between the items .
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) => ItemsOfDashboard(
                    item: items[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(item: items[index]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
