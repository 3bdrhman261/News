import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_api/core/routering/app_routering.dart';
import 'package:news_api/core/screens/HomeScreen/widget/custom_text_field.dart';

class Textfelfscreen extends StatefulWidget {
  const Textfelfscreen({super.key});

  @override
  State<Textfelfscreen> createState() => _TextfelfscreenState();
}

class _TextfelfscreenState extends State<Textfelfscreen> {
  bool showTextFelgd = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showTextFelgd
            ? CustomTextField(
                nameField: "Search",
                onFieldSubmitted: (value) {
                  GoRouter.of(
                    context,
                  ).pushNamed(AppRouter.searchResultsScreen, extra: value);
                },
              )
            : SizedBox.shrink(),
        IconButton(
          onPressed: () {
            setState(() {
              showTextFelgd = !showTextFelgd;
            });
          },
          icon: Icon(Icons.search, color: const Color(0xFF627D98), size: 30),
        ),
      ],
    );
  }
}
