import 'package:flutter/material.dart';
import 'package:fun_play/homepage/game_view.dart';

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
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Welcome to FunPlay",
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(hintText: "Enter your name"),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return GameView(
                          name: name,
                        );
                      },
                    ));
                  },
                  child: const Text(
                    "Start",
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
