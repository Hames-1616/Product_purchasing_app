import 'package:alemeno/core/dimensions.dart';
import 'package:alemeno/core/responsive_text.dart';
import 'package:alemeno/features/home/controller/HomeController.dart';
import 'package:alemeno/models/test_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class Tests extends ConsumerStatefulWidget {
  final TestModel popular;
  const Tests({super.key, required this.popular});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestsState();
}

class _TestsState extends ConsumerState<Tests> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.all(MediaQuery.of(context).size.height / hei(context, 12)),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / hei(context, 35),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Container(
              alignment: Alignment.center,
              child: ResponsiveText(
                textAlign: TextAlign.center,
                text: widget.popular.Name,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / hei(context, 8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ResponsiveText(
                  text: "include ${widget.popular.Tests} tests",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
                ),
                const Icon(
                  LineIcons.userShield,
                  color: Colors.indigo,
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / hei(context, 8),
                  left: MediaQuery.of(context).size.width / wid(context, 15)),
              child: Container(
                alignment: Alignment.centerLeft,
                child: ResponsiveText(
                  text: "Get Reports in 24 hours",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12.5),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / hei(context, 10),
                  left: MediaQuery.of(context).size.width / wid(context, 15)),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: ResponsiveText(
                      text: "₹ ${widget.popular.DPrice}",
                      style: const TextStyle(
                          color: Colors.indigo,
                          fontSize: 16.5,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width /
                            wid(context, 10)),
                    child: ResponsiveText(
                      text: widget.popular.Price,
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 13.5,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ),
                ],
              )),
          widget.popular.isAdd
              ? InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  child: Container(
                    alignment: Alignment.center,
                    height:
                        MediaQuery.of(context).size.height / hei(context, 40),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.height / hei(context, 10)),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: ResponsiveText(
                      text: "Added to cart",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    ref
                        .watch(homeControllerProvider.notifier)
                        .Updatecart(Name: widget.popular.uid);
                    
                   
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  child: Container(
                    alignment: Alignment.center,
                    height:
                        MediaQuery.of(context).size.height / hei(context, 40),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.height / hei(context, 10)),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(10)),
                    child: ResponsiveText(
                      text: "Add to Cart",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
