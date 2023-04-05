
import 'package:flutter/material.dart';
import 'package:online_ordering_app/constants/constant.dart';
import 'package:online_ordering_app/model/db.dart';

class CustomCard extends StatelessWidget {
   CustomCard({
    super.key,
    required this.size,
    required this.index
  });

  final Size size;
  int index;

  @override
  Widget build(BuildContext context) {
    return Card(
          margin: const EdgeInsets.only(
              left: 15, right: 15, bottom: 10, top: 5),
          color: grey,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                width: size.width * 0.3,
                height: size.width * 0.33,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(shopItems[index]['image']),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
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
              )
            ],
          ),
        );
  }
}
