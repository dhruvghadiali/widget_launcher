import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';

class AndroidAppDrawerHeaderWidget extends StatefulWidget {
  const AndroidAppDrawerHeaderWidget({super.key});

  @override
  State<AndroidAppDrawerHeaderWidget> createState() =>
      _AndroidAppDrawerHeaderWidgetState();
}

class _AndroidAppDrawerHeaderWidgetState
    extends State<AndroidAppDrawerHeaderWidget> {
  late Timer _timer;
  String _currentTime = '';
  String _currentTimeNational = '';
  String _currentDate = '';

  void getCurrentDateTime() {
    DateTime currentTime = DateTime.now();
    setState(() {
      _currentTime = DateFormat('hh:mm').format(currentTime);
      _currentTimeNational = DateFormat('a').format(currentTime);
      _currentDate = DateFormat('EEEE, dd MMMM yyyy ').format(currentTime);
    });
  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (Timer timer) {
        getCurrentDateTime();
      },
    );
  }

  @override
  void initState() {
    getCurrentDateTime();
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Text(
              _currentDate,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context)
                        .extension<ExtensionsThemeData>()!
                        .warning,
                  ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _currentTime,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, bottom: 15),
                child: Text(
                  _currentTimeNational,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
