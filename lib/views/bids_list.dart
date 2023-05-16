import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:importo/Model/BidModel.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/utilities/size_config.dart';
import 'package:http/http.dart' as http;
import 'package:importo/utilities/user.dart';
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
  }

  deleteSingleBid(id) async {
    print('deleting bid');
    var regBody = {"id": id};
    var response = await http.post(Uri.parse(deletebid),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody));
    print(response.body);
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status']) {
      Get.snackbar(
        "Success",
        "Bid successfully deleted!",
        icon: const Icon(Icons.check_box, color: Colors.green),
        snackPosition: SnackPosition.BOTTOM,
      );
      setState(() {
        _bidsList.removeWhere((element) => element.sId == id);
      });
    } else {
      Get.snackbar(
        "Error",
        "Something went wrong",
        icon: const Icon(Icons.warning, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  getData() async {
    await getBidsByUser(MyUser.USERID);
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
      appBar: AppBar(
        title: const Text('Bids'),
      ),
      body: _bidsList.isEmpty
          ? const Center(
              child: Text(
                'No bids to Show',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          image: DecorationImage(
                              image: _bidsList[index].category == 'Thread'
                                  ? const AssetImage('assets/thread.jpg')
                                  : _bidsList[index].category == 'Cotton Yarn'
                                      ? const AssetImage(
                                          'assets/cotton_yarn.jpg')
                                      : _bidsList[index].category ==
                                              'Finished Product'
                                          ? const AssetImage('assets/shirt.jpg')
                                          : const AssetImage(
                                              'assets/importo.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: HelperMethods().getMyDynamicHeight(30),
                              left: HelperMethods().getMyDynamicWidth(20),
                            ),
                            child: Text('Quantity: ' +
                                _bidsList[index].quantity.toString()),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: HelperMethods().getMyDynamicHeight(30),
                              left: HelperMethods().getMyDynamicWidth(20),
                            ),
                            child: Text(
                                'Price: ' + _bidsList[index].price.toString()),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: HelperMethods().getMyDynamicHeight(30),
                              left: HelperMethods().getMyDynamicWidth(20),
                            ),
                            child: Text('Location: ' +
                                _bidsList[index].location.toString()),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: HelperMethods().getMyDynamicHeight(30),
                              left: HelperMethods().getMyDynamicWidth(20),
                            ),
                            child: Text('Description: ' +
                                _bidsList[index].description.toString()),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          await deleteSingleBid(_bidsList[index].sId);
                        },
                        child: Container(
                            margin: EdgeInsets.only(
                              left: HelperMethods().getMyDynamicWidth(180),
                            ),
                            child: const Icon(Icons.delete)),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
