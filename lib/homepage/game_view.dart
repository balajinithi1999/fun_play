import 'package:flutter/material.dart';
import 'package:fun_play/homepage/data.dart';
import 'package:fun_play/homepage/result_view.dart';

class GameView extends StatefulWidget {
  final String name;
  const GameView({
    super.key,
    this.name = "",
  });

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  List<DataModel> data = DataRepository.getData();
  int index = 0;
  int score = 0;
  String answer = "";
  TextEditingController ctl = TextEditingController();
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
                const SizedBox(
                  height: 16,
                ),
                Image.asset(
                  data[index].imagePath,
                  height: 400,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  data[index].queAndAnsList[0].question,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: ctl,
                  onChanged: (value) {
                    answer = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your answer",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (index == data.length - 1) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ResultView(
                            score: score,
                            name: widget.name,
                          );
                        },
                      ));
                      return;
                    }
                    if (data[index]
                        .queAndAnsList[0]
                        .answer
                        .contains(answer.trim())) {
                      score = score + 1;
                    }
                    setState(() {
                      index = index + 1;
                      answer = "";
                      ctl.clear();
                    });
                  },
                  child: Text("Next"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
