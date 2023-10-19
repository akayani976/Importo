import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:importo/model/bid_model.dart';
import 'package:importo/utilities/colors.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:http/http.dart' as http;
import 'package:importo/utilities/user.dart';
import '../../utilities/config.dart';

class BidsListPage extends StatefulWidget {
  const BidsListPage({super.key});

  @override
  State<BidsListPage> createState() => _BidsListPageState();
}

class _BidsListPageState extends State<BidsListPage> {
  List<Success> _bidsList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    left: HelperMethods().getMyDynamicWidth(50),
                    right: HelperMethods().getMyDynamicWidth(50),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors().primaryThemeColor),
                    borderRadius: BorderRadius.circular(
                      HelperMethods().getMyDynamicHeight(20),
                    ),
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
                                    ? const AssetImage('assets/cotton_yarn.jpg')
                                    : _bidsList[index].category ==
                                            'Finished Product'
                                        ? const AssetImage('assets/shirt.jpg')
                                        : const AssetImage(
                                            'assets/importo.png'),
                            fit: BoxFit.fill,
                          ),
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
                            child:
                                Text('Quantity: ${_bidsList[index].quantity}'),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: HelperMethods().getMyDynamicHeight(30),
                              left: HelperMethods().getMyDynamicWidth(20),
                            ),
                            child: Text('Price: ${_bidsList[index].price}'),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: HelperMethods().getMyDynamicHeight(30),
                              left: HelperMethods().getMyDynamicWidth(20),
                            ),
                            child:
                                Text('Location: ${_bidsList[index].location}'),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: HelperMethods().getMyDynamicHeight(30),
                              left: HelperMethods().getMyDynamicWidth(20),
                            ),
                            child: Text(
                                'Description: ${_bidsList[index].description}'),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: const Text(
                                    'Are you sure you want to delete this bid?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      Get.snackbar('Deleting...', '');
                                      await deleteSingleBid(
                                          _bidsList[index].sId);
                                      if (mounted) {
                                        Navigator.of(context).pop();
                                      }
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: HelperMethods().getMyDynamicWidth(180),
                          ),
                          child: Icon(
                            Icons.delete,
                            color: AppColors().primaryThemeColor,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }

  getData() async {
    await getBidsByUser(MyUser.userId);
  }

  getBidsByUser(userId) async {
    var regBody = {"userId": userId};
    var response = await http.post(
      Uri.parse(getbid),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(regBody),
    );
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    final res = BidResponseModel.fromJson(jsonResponse);
    setState(
      () {
        _bidsList = res.success!;
      },
    );
  }

  deleteSingleBid(id) async {
    var regBody = {"id": id};
    var response = await http.post(Uri.parse(deletebid),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody));
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
}
