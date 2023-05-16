import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:importo/Model/BidModel.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/utilities/size_config.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class BidsListPage extends StatefulWidget {
  const BidsListPage({super.key});

  @override
  State<BidsListPage> createState() => _BidsListPageState();
}

class _BidsListPageState extends State<BidsListPage> {
  List<Success> _bidsList = [];
  getBidsByUser(userId) async {
    print('getting bids by user');
    var regBody = {"userId": userId};
    var response = await http.post(Uri.parse(getbid),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody));
    print(response.body);
    var jsonResponse = jsonDecode(response.body);
    final res = BidResponseModel.fromJson(jsonResponse);
    print(res.success);
    setState(() {
      _bidsList = res.success!;
    });

    ///Now the bids list is populated. now we have to show these
    // print(_bidsList[0].userId);

    // items = jsonResponse['success'];
  }

  getData() async {
    await getBidsByUser('6462a3a3d2600e2433b1689e');
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    AppLayout().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _bidsList.length,
        itemBuilder: (context, index) {
          return Container(
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
                    color: _bidsList[index].category == 'Thread'
                        ? Colors.amberAccent
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(
                      HelperMethods().getMyDynamicHeight(16),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: HelperMethods().getMyDynamicHeight(50),
                        left: HelperMethods().getMyDynamicWidth(20),
                      ),
                      child: Text(
                          'Quantity: ' + _bidsList[index].quantity.toString()),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: HelperMethods().getMyDynamicHeight(40),
                        left: HelperMethods().getMyDynamicWidth(20),
                      ),
                      child:
                          Text('Price: ' + _bidsList[index].price.toString()),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: HelperMethods().getMyDynamicHeight(40),
                        left: HelperMethods().getMyDynamicWidth(20),
                      ),
                      child: Text(
                          'Location: ' + _bidsList[index].location.toString()),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: HelperMethods().getMyDynamicHeight(40),
                        left: HelperMethods().getMyDynamicWidth(20),
                      ),
                      child: Text('Description: ' +
                          _bidsList[index].description.toString()),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(
                      left: HelperMethods().getMyDynamicWidth(180),
                    ),
                    child: const Icon(Icons.delete))
              ],
            ),
          );
        },
      ),
    );
  }
}
