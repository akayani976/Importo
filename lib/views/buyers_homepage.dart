import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/views/bids_list.dart';
import 'package:importo/widgets/buttons.dart';

class BuyerHomePage extends StatelessWidget {
  const BuyerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: HelperMethods().getMyDynamicHeight(290),
          padding: EdgeInsets.only(
              left: HelperMethods().getMyDynamicHeight(50),
              right: HelperMethods().getMyDynamicHeight(50)),
          color: const Color.fromARGB(255, 40, 157, 210),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(HelperMethods().getMyDynamicWidth(15)),
              Column(
                children: [
                  Gap(HelperMethods().getMyDynamicWidth(120)),
                  const Icon(IconData(0xe48d, fontFamily: 'MaterialIcons')),
                ],
              ),
              Gap(HelperMethods().getMyDynamicWidth(215)),
              Column(
                children: [
                  Gap(HelperMethods().getMyDynamicHeight(70)),
                  Text(
                    'Place Your',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: HelperMethods().getMyDynamicHeight(80)),
                  ),
                  Text(
                    'Bids',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: HelperMethods().getMyDynamicHeight(80)),
                  ),
                ],
              ),
              Gap(HelperMethods().getMyDynamicWidth(215)),
              Column(
                children: [
                  Gap(HelperMethods().getMyDynamicWidth(120)),
                  const Icon(IconData(0xe3b3, fontFamily: 'MaterialIcons')),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: HelperMethods().getMyDynamicHeight(499),
          width: HelperMethods().getMyDynamicWidth(1080),
          child: const Image(image: AssetImage('assets/importo.png')),
        ),
        Container(
          padding: EdgeInsets.only(
              top: HelperMethods().getMyDynamicHeight(20),
              left: HelperMethods().getMyDynamicHeight(50),
              right: HelperMethods().getMyDynamicHeight(50)),
          color: const Color.fromARGB(255, 65, 193, 186),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(HelperMethods().getMyDynamicHeight(30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: HelperMethods().getMyDynamicHeight(225),
                    width: HelperMethods().getMyDynamicWidth(225),
                    padding:
                        EdgeInsets.all(HelperMethods().getMyDynamicHeight(15)),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 40, 157, 210),
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(
                            HelperMethods().getMyDynamicHeight(50))),
                    child: Column(
                      children: [
                        Container(
                          height: HelperMethods().getMyDynamicHeight(120),
                          width: HelperMethods().getMyDynamicWidth(125),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  HelperMethods().getMyDynamicHeight(30)),
                              image: const DecorationImage(
                                  image: AssetImage('assets/cotton_yarn.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                        Gap(HelperMethods().getMyDynamicHeight(20)),
                        Text(
                          'Cotton Yarn',
                          style: TextStyle(
                              fontSize: HelperMethods().getMyDynamicHeight(25),
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: HelperMethods().getMyDynamicHeight(225),
                    width: HelperMethods().getMyDynamicWidth(225),
                    padding:
                        EdgeInsets.all(HelperMethods().getMyDynamicHeight(15)),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 40, 157, 210),
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(
                            HelperMethods().getMyDynamicHeight(50))),
                    child: Column(
                      children: [
                        Container(
                          height: HelperMethods().getMyDynamicHeight(120),
                          width: HelperMethods().getMyDynamicWidth(125),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  HelperMethods().getMyDynamicHeight(30)),
                              image: const DecorationImage(
                                  image: AssetImage('assets/thread.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                        Gap(HelperMethods().getMyDynamicHeight(20)),
                        Text(
                          'Thread',
                          style: TextStyle(
                              fontSize: HelperMethods().getMyDynamicHeight(25),
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: HelperMethods().getMyDynamicHeight(225),
                    width: HelperMethods().getMyDynamicWidth(225),
                    padding:
                        EdgeInsets.all(HelperMethods().getMyDynamicHeight(15)),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 40, 157, 210),
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(
                            HelperMethods().getMyDynamicHeight(50))),
                    child: Column(
                      children: [
                        Container(
                          height: HelperMethods().getMyDynamicHeight(120),
                          width: HelperMethods().getMyDynamicWidth(125),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  HelperMethods().getMyDynamicHeight(30)),
                              image: const DecorationImage(
                                  image: AssetImage('assets/shirt.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                        Gap(HelperMethods().getMyDynamicHeight(20)),
                        Text(
                          'Finished Products',
                          style: TextStyle(
                              fontSize: HelperMethods().getMyDynamicHeight(20),
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Gap(HelperMethods().getMyDynamicHeight(30)),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'What is your delivery location?',
                ),
              ),
              Gap(HelperMethods().getMyDynamicHeight(30)),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'What is the quantity you require?',
                ),
              ),
              Gap(HelperMethods().getMyDynamicHeight(30)),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'What is your preferred budget?',
                ),
              ),
              Gap(HelperMethods().getMyDynamicHeight(30)),
              const TextField(
                maxLines: 5,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a description...',
                ),
              ),
              Gap(HelperMethods().getMyDynamicHeight(40)),
              GestureDetector(
                onTap: () {
                  Get.to(() => const BidsListPage());
                },
                child: Container(
                  margin: EdgeInsets.only(
                      bottom: HelperMethods().getMyDynamicHeight(40)),
                  child: Button(
                      height: HelperMethods().getMyDynamicHeight(195),
                      width: HelperMethods().getMyDynamicWidth(1080),
                      text: 'Find Acceptable Bids'),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
