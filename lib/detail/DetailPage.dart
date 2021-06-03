import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutterdex/common/constants/Colors.dart';
import 'package:flutterdex/common/ui/CustomPlatformText.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        backgroundColor: offblack,
        appBar: PlatformAppBar(
          backgroundColor: gold,
          title: CustomPlatformText(id ?? "missingno",
              style: TextStyle(color: white)),
        ),
        body: new SafeArea(child: _testBody()));
  }

  Widget _testBody() {
    return Column(
      children: [
        _card(black, barBackgroundColor: mutedGold),
        Row(
          children: [
            Column(
              children: [
                Text("OffWhite",
                    style: TextStyle(
                        color: offwhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                Text("Gold",
                    style: TextStyle(
                        color: gold,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                Text("MutedGold",
                    style: TextStyle(
                        color: mutedGold,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ],
            ),
            Column(
              children: [
                Text("OffWhite",
                    style: TextStyle(
                        color: offwhite,
                        fontWeight: FontWeight.normal,
                        fontSize: 20)),
                Text("Gold",
                    style: TextStyle(
                        color: gold,
                        fontWeight: FontWeight.normal,
                        fontSize: 20)),
                Text("MutedGold",
                    style: TextStyle(
                        color: mutedGold,
                        fontWeight: FontWeight.normal,
                        fontSize: 20)),
              ],
            ),
            Column(
              children: [
                Text("White",
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20))
              ],
            ),
            Column(
              children: [
                Text("White",
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20))
              ],
            ),
          ],
        ),
        _card(lightGrey, barBackgroundColor: grey),
        _card(darkGrey, barBackgroundColor: lightGrey)
      ],
    );
  }

  Widget _chart(Color backgroundColor, {Color? barColor, Color? barBackgroundColor}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BarChart(BarChartData(
          barGroups: _bars(barColor, barBackgroundColor),
          backgroundColor: backgroundColor,
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
              leftTitles: SideTitles(showTitles: false),
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) => TextStyle(color: offwhite, fontWeight: FontWeight.bold, fontSize: 14),
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'M';
                    case 1:
                      return 'T';
                    case 2:
                      return 'W';
                    case 3:
                      return 'T';
                    case 4:
                      return 'F';
                    case 5:
                      return 'S';
                    case 6:
                      return 'S';
                    default:
                      return '';
                  }
                },
              )))),
    );
  }

  List<BarChartGroupData> _bars([Color? barColor, Color? barBackgroundColor]) {
    return [
      _bar(0, 1, barColor, barBackgroundColor),
      _bar(1, 2, barColor, barBackgroundColor),
      _bar(2, 6, barColor, barBackgroundColor),
      _bar(3, 4, barColor, barBackgroundColor),
    ];
  }

  BarChartGroupData _bar(int x, double y, [Color? barColor, Color? barBackgroundColor]) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
          colors: [barColor ?? gold],
          y: y,
          backDrawRodData:
              BackgroundBarChartRodData(show: true, y: 5, colors: [barBackgroundColor ?? grey]))
    ]);
  }

  Widget _card(Color color, {Color? barColor, Color? barBackgroundColor}) {
    return SizedBox(
        width: 200,
        height: 200,
        child: Card(
            color: color,
            child: _chart(color, barColor: barColor, barBackgroundColor: barBackgroundColor),
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(16))));
  }

  Widget _circle(Color color) {
    return Container(
        width: 200,
        height: 200,
        decoration: new BoxDecoration(color: color, shape: BoxShape.circle));
  }

  Widget _body() {
    return SafeArea(
      child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [AspectRatio(child: _body(), aspectRatio: 2 / 1)])),
    );
  }

  Widget _graph() {
    return Container(
      child: LineChart(LineChartData(
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 5,
          lineTouchData: LineTouchData(
              enabled: true,
              getTouchedSpotIndicator: (barData, spotIndexes) {
                return [
                  TouchedSpotIndicatorData(
                      FlLine(color: Colors.transparent), FlDotData())
                ];
              },
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: Colors.white,
                fitInsideHorizontally: true,
                fitInsideVertically: true,
                tooltipRoundedRadius: 8,
                getTooltipItems: (touchedSpots) {
                  return [
                    LineTooltipItem(
                        '29-05-21 07:30',
                        TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text: '\nPrice: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                              children: [
                                TextSpan(
                                    text: '30554.5',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))
                              ])
                        ])
                  ];
                },
              )),
          extraLinesData:
              ExtraLinesData(extraLinesOnTop: true, horizontalLines: [
            HorizontalLine(y: 1.5, color: Colors.grey, strokeWidth: 0.1),
            HorizontalLine(y: 2.5, color: Colors.grey, strokeWidth: 0.1),
            HorizontalLine(y: 3.5, color: Colors.grey, strokeWidth: 0.1)
          ]),
          titlesData: FlTitlesData(
              bottomTitles: SideTitles(
                showTitles: true,
                margin: -35,
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 1:
                      return '20:00';
                    case 2:
                      return '00:00';
                    case 3:
                      return '04:00';
                    case 4:
                      return '08:00';
                    case 5:
                      return '12:00';
                  }
                  return '';
                },
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 1:
                      return '15k';
                    case 2:
                      return '20k';
                    case 3:
                      return '25k';
                    case 4:
                      return '30k';
                  }
                  return '';
                },
              )),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(color: Colors.grey, strokeWidth: 0.3);
            },
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
                spots: [
                  FlSpot(0, 3),
                  FlSpot(1.6, 2),
                  FlSpot(3.9, 3.5),
                  FlSpot(4, 2.5),
                  FlSpot(5.3, 3),
                  FlSpot(5.5, 3.7),
                  FlSpot(6, 4)
                ],
                isCurved: true,
                isStrokeCapRound: true,
                colors: [Colors.blue],
                dotData: FlDotData(show: false),
                barWidth: 3),
          ])),
    );
  }
}
