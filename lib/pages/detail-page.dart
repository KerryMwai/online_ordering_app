import 'package:flutter/material.dart';
import 'package:online_ordering_app/constants/constant.dart';
import 'package:online_ordering_app/pages/mobile-detail-view.dart';
import 'package:online_ordering_app/pages/tablet-detail-veiw.dart';
import 'package:online_ordering_app/widgets/custom-button.dart';
import 'package:online_ordering_app/widgets/custom-circle-container.dart';
import 'dart:convert';

class DetailPage extends StatefulWidget {
  String name, image, price, rating, likes, dislikes, description;
  List<String> similar_items;
  int _counter = 1;
  double _total_price = 0;
  DetailPage(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.rating,
      required this.likes,
      required this.dislikes,
      required this.similar_items,
      required this.description});
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroundcolor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_border))
          ],
        ),
        body: Container(
            width: size.width,
            height: size.height,
            child: size.width <= 412
                ? MobileDetailView(
                    name: widget.name,
                    image: widget.image,
                    price: widget.price,
                    rating: widget.rating,
                    likes: widget.likes,
                    dislikes: widget.dislikes,
                    similar_itemts: widget.similar_items,
                    description: widget.description)
                : TabletDetailView(
                    name: widget.name,
                    image: widget.image,
                    price: widget.price,
                    rating: widget.rating,
                    likes: widget.likes,
                    dislikes: widget.dislikes,
                    similar_items: widget.similar_items,
                    description: widget.description)));
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
