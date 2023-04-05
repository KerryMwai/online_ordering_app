import 'package:flutter/material.dart';
import 'package:online_ordering_app/constants/constant.dart';
import 'package:online_ordering_app/model/db.dart';

class TabletCustomCard extends StatelessWidget {
  Size size; int index; 
  TabletCustomCard({super.key, required this.index,required this.size});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Card(
          margin: const EdgeInsets.only(
              left: 15, right: 15, bottom: 10, top: 5),
          color: grey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                width: size.width * 0.4,
                height: size.width * 0.25,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(shopItems[index]['image']),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(shopItems[index]['name'],
                        style: const TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 18,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Ksh. ${shopItems[index]['price']}",
                        style: const TextStyle(
                          fontFamily: "Alkatra",
                          fontSize: 16,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                           vertical: 5.0),
                      child: Center(
                        child: Row(
                          children: [
                            const Text("Rating: ", style: TextStyle(fontFamily: "RobotoLight"),),
                            Row(
                              children: List.generate(
                                  shopItems[index]['rating'],
                                  (index) =>  Icon(
                                        Icons.star,
                                        color: orange.withOpacity(0.4),
                                      )),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );;
  }
}