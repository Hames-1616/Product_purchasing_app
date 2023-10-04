import 'package:alemeno/core/dimensions.dart';
import 'package:alemeno/core/responsive_text.dart';
import 'package:alemeno/features/home/controller/HomeController.dart';
import 'package:alemeno/features/home/screen/cart.dart';
import 'package:alemeno/features/home/screen/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartPage extends ConsumerStatefulWidget {
  const StartPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StartPageState();
}

class _StartPageState extends ConsumerState<StartPage> {
  @override
  Widget build(BuildContext context) {
    final populars = ref.watch(getPopularProvider);
    bool badge = false;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: ResponsiveText(
            text: "Logo",
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / wid(context, 10)),
              child: Badge(
                isLabelVisible: badge,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Cart()));
                    },
                    icon: Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.blue.shade900,
                    )),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / wid(context, 18),
                  top: MediaQuery.of(context).size.height / hei(context, 10),
                  right: MediaQuery.of(context).size.width / wid(context, 5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResponsiveText(
                    text: "Popular Lab Tests",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 22.5,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height /
                            hei(context, 8)),
                    child: TextButton(
                      onPressed: () {},
                      child: ResponsiveText(
                        text: "view more ",
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            decorationThickness: 0.9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            populars.when(data: (data) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / hei(context, 700),
                child: GridView.builder(
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Tests(
                        popular: data[index],
                      );
                    }),
              );
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
            }
            )
          ],
        ));
  }
}
