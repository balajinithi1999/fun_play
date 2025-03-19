import 'package:flutter/material.dart';
import 'package:fun_play/homepage/data.dart';
import 'package:fun_play/homepage/game_view.dart';
import 'package:fun_play/utils.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({super.key});

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.primaryColor,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/waving.gif"),
            Container(
              decoration: BoxDecoration(
                color: Utils.secondaryColor,
                borderRadius: BorderRadius.circular(
                  40,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Welcome to PlayTime",
                    style: Utils.textStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    style: Utils.textStyle,
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                      hintStyle: Utils.textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: Utils.textStyle,
                        backgroundColor: Utils.primaryColor,
                      ),
                      onPressed: () async {
                        await showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(
                                16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  40,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Instructions",
                                    style: Utils.textStyle.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  ListView.builder(
                                    itemCount: rules.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Text(
                                        rules[index],
                                        style: Utils.textStyle.copyWith(
                                          color: Colors.black,
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      textStyle: Utils.textStyle,
                                      backgroundColor: Utils.primaryColor,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) {
                                          return GameView(
                                            name: name,
                                          );
                                        },
                                      ));
                                    },
                                    child: Text(
                                      "Start",
                                      style: Utils.textStyle,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        "Start",
                        style: Utils.textStyle,
                      )),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
