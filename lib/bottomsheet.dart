import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheetshowingButton extends StatelessWidget {
  const BottomSheetshowingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Text('showBottomSheet', style: GoogleFonts.lato()))),
      onTap: () {
        Scaffold.of(context).showBottomSheet<void>(
          (BuildContext context) {
            return Container(
              height: 200,
              color: Colors.amber,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    buildProfileLevelIndicator(),
                    Text('BottomSheet', style: GoogleFonts.openSans()),
                    _buildCard(context)
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Flexible buildProfileLevelIndicator() {
    return Flexible(
        child: Stack(alignment: Alignment.topCenter, children: [
      SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            strokeWidth: 10,
            value: 0.95,
            valueColor:
                AlwaysStoppedAnimation<Color>(Colors.lightGreenAccent[400]!),
          )),
      Container(
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.blue[400]),
        height: 100,
        width: 100,
      )
    ]));
  }

  Card _buildCard(BuildContext context) {
    return Card(
        child: InkWell(
      child: const Padding(
          padding: EdgeInsets.all(10), child: Text('Close BottomSheet')),
      onTap: () {
        Navigator.pop(context);
      },
    ));
  }
}
