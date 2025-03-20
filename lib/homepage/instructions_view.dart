import 'package:flutter/material.dart';
import 'package:fun_play/homepage/data.dart';
import 'package:fun_play/homepage/game_view.dart';
import 'package:fun_play/utils.dart';

class InstructionsView extends StatelessWidget {
  final String name;
  const InstructionsView({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.secondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Utils.primaryColor,
        title: Text(
          "Instructions",
          style: Utils.textStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/idea.gif",
                  height: 200,
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.builder(
                  itemCount: rules.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Text(
                      rules[index],
                      style: Utils.textStyle,
                    );
                  },
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
          ),
        ),
      ),
    );
  }
}
