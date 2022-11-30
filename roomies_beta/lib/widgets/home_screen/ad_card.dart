import 'package:flutter/material.dart';
import '../../models/size_config.dart';

class AdCard extends StatelessWidget {
  const AdCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      color: const Color.fromRGBO(255, 204, 128, 1),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.03,
            vertical: SizeConfig.screenHeight * 0.015),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Do you want to \nsupport us?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.blockSizeVertical * 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.02,
                        vertical: SizeConfig.screenHeight * 0.007),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.white,
                    ),
                    child: Text(
                      'Buy us a coffee!',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 204, 128),
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockSizeVertical * 1.7,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                child: Image.asset(
                  'assets/images/buy-me-a-coffee.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
