import 'package:flutter/material.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/utilities/size_config.dart';

class BidsListPage extends StatelessWidget {
  const BidsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLayout().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: HelperMethods().getMyDynamicHeight(350),
        margin: EdgeInsets.only(
          top: HelperMethods().getMyDynamicHeight(20),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          children: [
            Container(
              height: HelperMethods().getMyDynamicHeight(250),
              width: HelperMethods().getMyDynamicWidth(250),
              margin: EdgeInsets.only(
                left: HelperMethods().getMyDynamicWidth(30),
                top: HelperMethods().getMyDynamicHeight(40),
                bottom: HelperMethods().getMyDynamicHeight(40),
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(
                  HelperMethods().getMyDynamicHeight(16),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: HelperMethods().getMyDynamicHeight(50),
                    left: HelperMethods().getMyDynamicWidth(20),
                  ),
                  child: const Text('Quantity'),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: HelperMethods().getMyDynamicHeight(40),
                    left: HelperMethods().getMyDynamicWidth(20),
                  ),
                  child: const Text('Budget'),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: HelperMethods().getMyDynamicHeight(40),
                    left: HelperMethods().getMyDynamicWidth(20),
                  ),
                  child: const Text('Location'),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                left: HelperMethods().getMyDynamicWidth(80),
              ),
              child: const Text('Description'),
            ),
            Container(
                margin: EdgeInsets.only(
                  left: HelperMethods().getMyDynamicWidth(180),
                ),
                child: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
