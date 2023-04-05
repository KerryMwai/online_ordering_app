import 'package:flutter/material.dart';
import 'package:online_ordering_app/constants/constant.dart';
import 'package:online_ordering_app/model/db.dart';
import 'package:online_ordering_app/pages/detail-page.dart';
import 'package:online_ordering_app/widgets/custom-card.dart';
import 'package:online_ordering_app/widgets/tablet-custom-card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width);
    print(size.height);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Enjoying Shopping"),
          centerTitle: true,
          backgroundColor: blueGrey,
        ),
        body: size.width <= 412
            ? ListView(
                children: List.generate(
                  shopItems.length,
                  (index) => GestureDetector(
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => DetailPage(
                                          name: shopItems[index]['name'],
                                          image: shopItems[index]['image'],
                                          price: shopItems[index]['price']
                                              .toString(),
                                          rating: shopItems[index]['rating']
                                              .toString(),
                                          likes: shopItems[index]['likes']
                                              .toString(),
                                          dislikes: shopItems[index]['dislikes']
                                              .toString(),
                                          similar_items: shopItems[index]
                                              ['similar-items'],
                                          description: shopItems[index]
                                              ['discrition'],
                                        ))))
                          },
                      child: CustomCard(size: size, index: index)),
                ),
              )
            : GridView.builder(
                itemCount: shopItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 2.3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => DetailPage(
                                          name: shopItems[index]['name'],
                                          image: shopItems[index]['image'],
                                          price: shopItems[index]['price']
                                              .toString(),
                                          rating: shopItems[index]['rating']
                                              .toString(),
                                          likes: shopItems[index]['likes']
                                              .toString(),
                                          dislikes: shopItems[index]
                                              ['dislikes'].toString(),
                                          similar_items: shopItems[index]
                                              ['similar-items'],
                                          description: shopItems[index]
                                              ['discrition'],
                                        ))))
                          },
                      child: TabletCustomCard(size: size, index: index));
                }));
  }
}
