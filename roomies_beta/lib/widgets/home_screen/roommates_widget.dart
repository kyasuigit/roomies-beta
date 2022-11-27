import 'package:flutter/material.dart';

class RoommatesWidget extends StatefulWidget {
  const RoommatesWidget({super.key});

  @override
  State<RoommatesWidget> createState() => _RoommatesWidgetState();
}

class _RoommatesWidgetState extends State<RoommatesWidget> {
  final int _userCount = 4;
  bool _isMinimized = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: const Text(
                'Roommates',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              icon: _isMinimized
                  ? const Icon(Icons.add)
                  : const Icon(Icons.remove),
              splashRadius: 20,
              onPressed: () {
                setState(() {
                  _isMinimized = !_isMinimized;
                });
              },
            ),
          ],
        ),
        _isMinimized
            ? Container()
            : Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      padding: _userCount > 4
                          ? const EdgeInsets.only(bottom: 0)
                          : const EdgeInsets.only(bottom: 10),
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: _userCount > 4
                            ? MediaQuery.of(context).size.width / 9.5
                            : MediaQuery.of(context).size.width /
                                _userCount /
                                2.5,
                        alignment: WrapAlignment.spaceAround,
                        children: <Widget>[
                          for (int i = 0; i < _userCount; i++)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 204, 128),
                                  radius: 26.0,
                                ),
                                SizedBox(height: 8.0),
                                Text("User"),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
