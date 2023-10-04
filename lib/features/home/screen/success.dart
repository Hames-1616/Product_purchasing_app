import 'package:alemeno/core/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Success extends ConsumerStatefulWidget {
  const Success({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SuccessState();
}

class _SuccessState extends ConsumerState<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: ResponsiveText(text: "Success",style: const TextStyle(color: Colors.black,fontSize: 20),),
      ),
      body: Center(child: ResponsiveText(text: "Order Placed successfully",style: const TextStyle(fontSize: 25,color: Colors.black),),)
    );
  }
}
