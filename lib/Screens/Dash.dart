import 'package:flutter/material.dart';
import 'package:luxelooks/displays/maincard.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  final TextEditingController _searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 35,
                  child: TextFormField(
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Search for a Service Provider',
                      hintStyle: const TextStyle(fontStyle: FontStyle.normal),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 30,
                          )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    autofocus: false,
                    controller: _searchcontroller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.search,
                    textCapitalization: TextCapitalization.words,
                    enableSuggestions: true,
                    enabled: true,
                    enableInteractiveSelection: true,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Top Rated",
          style: TextStyle(fontSize: 25),
        ),
        const CardDisplay(),
        const SizedBox(height: 5.0),
      ],
    );
  }
}
