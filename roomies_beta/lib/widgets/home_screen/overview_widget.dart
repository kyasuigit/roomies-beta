import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OverviewWidget extends StatefulWidget {
  const OverviewWidget({super.key});

  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  late List<YourTasks> _tasks;
  late TooltipBehavior _tooltipBehavior;
  bool _isMinimized = false;

  @override
  void initState() {
    _tasks = getTasks;
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

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
                'Overview',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              icon: (_isMinimized
                  ? const Icon(Icons.add)
                  : const Icon(Icons.remove)),
              splashRadius: 20,
              onPressed: () {
                setState(() {
                  _isMinimized = !_isMinimized;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 5),
        _isMinimized
            ? Container()
            : Card(
                child: Container(
                  color: const Color(0xFFFFF7EB),
                  height: 250,
                  child: SfCircularChart(
                    tooltipBehavior: _tooltipBehavior,
                    legend: Legend(
                      isVisible: true,
                      position: LegendPosition.bottom,
                      overflowMode: LegendItemOverflowMode.scroll,
                      orientation: LegendItemOrientation.auto,
                      alignment: ChartAlignment.center,
                      shouldAlwaysShowScrollbar: true,
                    ),
                    series: <CircularSeries>[
                      PieSeries<YourTasks, String>(
                        dataSource: _tasks,
                        xValueMapper: (YourTasks task, _) => task.taskName,
                        yValueMapper: (YourTasks task, _) => task.count,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true),
                        enableTooltip: true,
                      )
                    ],
                  ),
                ),
              ),
      ],
    );
  }

  List<YourTasks> get getTasks {
    return [
      YourTasks(taskName: "Dishes", count: 4),
      YourTasks(taskName: "Laundry", count: 1),
      YourTasks(taskName: "Vacuuming", count: 3),
      YourTasks(taskName: "Organize Fridge", count: 5),
      YourTasks(taskName: "Organize Shoes", count: 4),
      YourTasks(taskName: "Split Groceries", count: 5),
    ];
  }
}

class YourTasks {
  final String taskName;
  final int count;

  YourTasks({required this.taskName, required this.count});
}
