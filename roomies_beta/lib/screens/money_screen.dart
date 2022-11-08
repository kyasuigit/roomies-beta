import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/house.dart';

class MoneyScreen extends StatelessWidget {
  const MoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("Add User"),
        onPressed: () {},
      ),
    );
  }
}
