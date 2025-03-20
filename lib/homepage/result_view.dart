import 'package:flutter/material.dart';
import 'package:fun_play/homepage/homepage_view.dart';
import 'package:fun_play/utils.dart';

class ResultView extends StatefulWidget {
  final String name;
  final int score;
  const ResultView({
    super.key,
    this.name = "",
    this.score = 0,
  });

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Utils.secondaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Utils.primaryColor,
          title: Text(
            "Thanks ${widget.name}!",
            style: Utils.textStyle,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/thanks.gif",
                    height: 300,
                  ),
                  Text(
                    "You scored : ${widget.score} points",
                    style: Utils.textStyle.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
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
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const HomepageView();
                          },
                        ));
                      },
                      child: Text(
                        "Go Home",
                        style: Utils.textStyle,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
