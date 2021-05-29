import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutterdex/common/ui/CustomPlatformText.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: CustomPlatformText(id ?? "missingno"),
      ),
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [AspectRatio(child: _body(), aspectRatio: 2 / 1)])),
      ),
    );
  }

  Widget _body() {
    return Container(
      child: LineChart(LineChartData(
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 5,
          lineTouchData: LineTouchData(
              enabled: true,
              getTouchedSpotIndicator: (barData, spotIndexes) {
                return [TouchedSpotIndicatorData(FlLine(color: Colors.transparent), FlDotData())];
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
