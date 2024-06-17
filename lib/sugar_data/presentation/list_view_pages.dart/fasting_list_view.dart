import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/widgets/circle.dart';
import '../../../core/widgets/colors.dart';

ListView fastingDataPage(
  List<dynamic> bloodSugarKeys,
  Box? bloodSugarDataBox,
) {
  return ListView.builder(
    itemCount: bloodSugarKeys.length,
    itemBuilder: (context, index) {
      Map bloodSugar = bloodSugarDataBox!.get(bloodSugarKeys[index]);
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.125,
          decoration: BoxDecoration(
            color: kTextFieldFillColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: kBoxShadowColor,
                offset: const Offset(5, 5),
                blurRadius: 5,
              )
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.01,
                left: MediaQuery.sizeOf(context).width * 0.05,
                child: Circles(
                  bgColor: double.parse(bloodSugar['content']) > 7
                      ? kSugarNotOkColor
                      : double.parse(bloodSugar['content']) < 4
                          ? Colors.blue
                          : kSugarOkColor,
                  radiusBig: MediaQuery.sizeOf(context).width * 0.11,
                  radiusSmall: MediaQuery.sizeOf(context).width * 0.1,
                ),
              ),
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.05,
                left: MediaQuery.sizeOf(context).width * 0.06,
                child: Text(
                  '${bloodSugar['content']}mmol',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.042,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.06,
                left: MediaQuery.sizeOf(context).width * 0.32,
                child: Text(
                  bloodSugar['date'].toString(),
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.038,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.082,
                left: MediaQuery.sizeOf(context).width * 0.32,
                child: Text(
                  bloodSugar['time'].toString(),
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.038,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.06,
                left: MediaQuery.sizeOf(context).width * 0.75,
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Delete Data'),
                          content: const Text('Are You Sure?'),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                await bloodSugarDataBox
                                    .delete(bloodSugarKeys[index]);
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);
                              },
                              child: const Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.delete),
                  color: kButtonsColor,
                ),
              ),
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.06,
                left: MediaQuery.sizeOf(context).width * 0.65,
                child: IconButton(
                  onPressed: () {
                    Share.share(
                      'Fasting \nSugar Level: ${bloodSugar['content']}mmol, \nDate:${bloodSugar['date'].toString()}, \nTime: ${bloodSugar['time'].toString()},'
                      '\ngluco pulse',
                    );
                    // Share.share('gluco pulse' );
                  },
                  icon: const Icon(Icons.share),
                  color: kButtonsColor,
                ),
              ),
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.03,
                left: MediaQuery.sizeOf(context).width * 0.32,
                child: Text(
                  'Fasting',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.042,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
