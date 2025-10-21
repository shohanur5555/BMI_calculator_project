import 'package:bmi_calculate_app/bmi/bmi_provider.dart';
import 'package:bmi_calculate_app/bmi/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

class BmiDetailsPage extends StatelessWidget {
  const BmiDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Details'),
      ),
      body: Form(child: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Catagory', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('BMI (KG/m2)', style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          for(final key in statusMap.keys)
            Container(
              margin: EdgeInsets.all(2.0),
              padding: EdgeInsets.all(2.0),
              color: context.read<BmiProvider>().bmiStatus ==key? Colors.grey : Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(key),
                  Text(statusMap[key]!),
                ],
              ),
            )
          ,
         /* for(final key in statusPhotos.keys)
            Container(
              margin: EdgeInsets.all(2.0),
              padding: EdgeInsets.all(2.0),
              width: double.infinity,
              height: 300,
              color: Colors.grey[300],
               child: Center(
                child: statusPhotos.containsKey(bmiStatus)
                 ? Image.asset(
    statusPhotos [bmiStatus]!,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
    )
        : const Text('No image found 😅'),*/
             // child: context.read<BmiProvider>().bmiStatus == key? Image.asset(statusPhotos[key]!) : const Text('No image found'),
             /* color: context.read<BmiProvider>().bmiStatus ==key? Colors.grey : Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(statusPhotos[key]!,

                  )
                ],
              ),*/
            )

        ],
      )),
    );
  }
}
