import 'package:flutter/material.dart';
import 'package:fun_play/homepage/homepage_view.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                Text(
                  widget.name,
                ),
                SizedBox(
                  height: 16,
                ),
                Text("You scored ${widget.score}"),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return HomepageView();
                        },
                      ));
                    },
                    child: const Text(
                      "Go Home",
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
