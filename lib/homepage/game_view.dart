import 'package:flutter/material.dart';
import 'package:fun_play/homepage/data.dart';
import 'package:fun_play/homepage/result_view.dart';
import 'package:fun_play/utils.dart';

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
  bool isTimerRunning = false;
  int timerMaxSeconds = 30;

  @override
  initState() {
    super.initState();

    callTimer();
  }

  callTimer() async {
    setState(() {
      isTimerRunning = true;
    });
    for (int i = 0; i <= 29; i++) {
      await Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          timerMaxSeconds = timerMaxSeconds - 1;
        });
      });
    }
    setState(() {
      isTimerRunning = false;
      timerMaxSeconds = 30;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.secondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Utils.primaryColor,
        title: Text(
          "Level ${index + 1}",
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
                const SizedBox(
                  height: 16,
                ),
                if (isTimerRunning)
                  Image.asset(
                    data[index].imagePath,
                    height: 300,
                  ),
                if (!isTimerRunning)
                  const Icon(
                    Icons.question_mark_rounded,
                    size: 300,
                    color: Colors.white,
                  ),
                if (isTimerRunning) ...[
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Time Remaining : ${timerMaxSeconds}s",
                    style: Utils.textStyle.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                if (!isTimerRunning) ...[
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    data[index].queAndAnsList[0].question,
                    style: Utils.textStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    style: Utils.textStyle,
                    controller: ctl,
                    onChanged: (value) {
                      answer = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your answer",
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
                        callTimer();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: Utils.textStyle,
                      backgroundColor: Utils.primaryColor,
                    ),
                    child: Text(
                      "Next",
                      style: Utils.textStyle,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
