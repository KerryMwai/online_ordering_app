import 'package:flutter/material.dart';
import 'package:online_ordering_app/constants/constant.dart';
import 'package:online_ordering_app/widgets/custom-button.dart';
import 'package:online_ordering_app/widgets/custom-circle-container.dart';

class MobileDetailView extends StatefulWidget {
  String name, image, price, rating, likes, dislikes, description;
  List<String> similar_itemts;
  int _counter = 1;
  double _total_price = 0;
  MobileDetailView(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.rating,
      required this.likes,
      required this.dislikes,
      required this.similar_itemts,
      required this.description});

  @override
  State<MobileDetailView> createState() => _MobileDetailViewState();
}

class _MobileDetailViewState extends State<MobileDetailView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.only(left: 10, top: 30),
            height: size.height * 0.7,
            width: size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
              color: white,
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontFamily: "Alkatra",
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Ksh. ${widget.price}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "OpenSansItalic",
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: orange),
                        const SizedBox(width: 5),
                        Text(
                          widget.rating,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 10),
                        const Text("|", style: TextStyle(fontSize: 24)),
                        const SizedBox(width: 10),
                        const Icon(Icons.thumb_up, color: blue),
                        const SizedBox(width: 5),
                        Text(
                          widget.likes,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 10),
                        const Text("|", style: TextStyle(fontSize: 24)),
                        const SizedBox(width: 10),
                        const Icon(Icons.thumb_down, color: black),
                        const SizedBox(width: 5),
                        Text(
                          widget.dislikes,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const[
                 SizedBox(width: 20.0,),
                 Text("Similar Items", style: TextStyle(fontFamily: "Alkatra", fontSize: 19, fontWeight: FontWeight.w800, letterSpacing: 2.0),),
              ],
            ),
            const SizedBox(height: 10,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        widget.similar_itemts.length,
                        (index) => Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              height: size.height * 0.2,
                              width: size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: grey,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          widget.similar_itemts[index]),
                                      fit: BoxFit.cover)),
                            )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text("About: ",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Alkatra"),),
                        Text(widget.name,style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "OpenSansItalic")),
                      ],
                    ),
                    Text(
                  widget.description,
                  style: TextStyle(color: black.withOpacity(0.6)),
                ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      "Total: ",
                      style: TextStyle(
                          fontFamily: "OpenSans", fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget._total_price == 0
                          ? "Ksh. ${widget.price}"
                          : "Ksh. ${widget._total_price}",
                      style: TextStyle(
                          fontFamily: "OpenSansItalic",
                          fontWeight: FontWeight.w600,
                          color: black.withOpacity(0.5)),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (widget._counter == 1) {
                                    return;
                                  } else {
                                    _decrementItem();
                                    _getTotalPrice();
                                  }
                                });
                              },
                              child: CustomCircleContainer(icon: Icons.remove)),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${widget._counter}",
                            style: const TextStyle(fontSize: 22),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  _incrementItem();
                                  _getTotalPrice();
                                });
                              },
                              child: CustomCircleContainer(icon: Icons.add)),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        print("Product added successfully");
                        widget._counter = 1;
                        widget._total_price = 0;
                      });
                    },
                    child: CustomButton(buttonText: "Add to Cart"))
              ]),
            ),
          )),
      Positioned(
          left: size.width * 0.3,
          top: 20,
          child: Container(
            width: size.width * 0.4,
            height: size.width * 0.42,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(widget.image), fit: BoxFit.cover)),
          )),
    ]);
  }

  void _incrementItem() {
    widget._counter++;
  }

  void _decrementItem() {
    widget._counter--;
  }

  void _getTotalPrice() {
    widget._total_price = double.parse(widget.price) * widget._counter;
  }
}
