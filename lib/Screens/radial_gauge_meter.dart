import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class radialGaugeMeter extends StatelessWidget {
  const radialGaugeMeter({required this.Ans, super.key});

  final double Ans;

  @override
  Widget build(BuildContext context) {
    double gaugeValue = Ans.isNaN || Ans.isInfinite ? 0 : Ans;
    String answer = gaugeValue.toStringAsFixed(2);

    return Column(
      children: [
        SizedBox(
          height: 270,
          child: Container(
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 150,
                  ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 0,
                        endValue: 50,
                        color: Colors.deepPurple.shade300),
                    GaugeRange(
                        startValue: 50,
                        endValue: 100,
                        color: Colors.lightBlueAccent.shade100),
                    GaugeRange(
                        startValue: 100,
                        endValue: 150,
                        color: Colors.grey.shade400)
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(value: gaugeValue)
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Container(
                          child: Text(
                            answer,
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.5)
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
