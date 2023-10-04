import 'package:alemeno/core/Notification.dart';
import 'package:alemeno/core/dimensions.dart';
import 'package:alemeno/core/providers.dart';
import 'package:alemeno/core/responsive_text.dart';
import 'package:alemeno/features/home/controller/HomeController.dart';
import 'package:alemeno/features/home/screen/cart_items.dart';
import 'package:alemeno/features/home/screen/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cart extends ConsumerStatefulWidget {
  const Cart({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: ResponsiveText(
            text: "Cart",
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        body: Center(
            child: ref.watch(totalProvider.notifier).state != 0
                ? ref.watch(getPopularProvider).when(data: (data) {
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          if (data[index].isAdd == true) {
                            return cartDetails(popular: data[index]);
                          } else {
                            return Container();
                          }
                        });
                  }, error: (error, st) {
                    return Center(
                      child: Text("error occured ${error.toString}"),
                    );
                  }, loading: () {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.indigo,
                      ),
                    );
                  })
                : Center(
                    child: ResponsiveText(
                      text: "The cart is empty",
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  )),
        bottomNavigationBar: ref.watch(totalProvider.notifier).state != 0
            ? InkWell(
                onTap: () {
                  ref.watch(getPopularProvider).whenData((value) {
                    for (int i = 0; i < value.length; i++) {
                      if (value[i].isAdd == true) {
                        ref
                            .watch(homeControllerProvider.notifier)
                            .removeCart(Name: value[i].uid);
                      }
                    }
                  });
                  trigger();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Success()));
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
                      text:
                          "Checkout ₹ ${ref.watch(totalProvider.notifier).state}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    )))
            : InkWell(
                onTap: () {},
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
                      text:
                          "Checkout ₹ ${ref.watch(totalProvider.notifier).state}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ))));
  }
}
