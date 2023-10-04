import 'package:alemeno/core/dimensions.dart';
import 'package:alemeno/core/responsive_text.dart';
import 'package:alemeno/features/home/controller/HomeController.dart';
import 'package:alemeno/models/test_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class cartDetails extends ConsumerStatefulWidget {
  final TestModel popular;
  const cartDetails({super.key, required this.popular});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _cartDetailsState();
}

class _cartDetailsState extends ConsumerState<cartDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.all(MediaQuery.of(context).size.height / hei(context, 12)),
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
          InkWell(
            onTap: () {
              ref
                  .watch(homeControllerProvider.notifier)
                  .removeCart(Name: widget.popular.uid);

              
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / hei(context, 40),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(
                  MediaQuery.of(context).size.height / hei(context, 10)),
              decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(10)),
              child: ResponsiveText(
                text: "Remove",
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
