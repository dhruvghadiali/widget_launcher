import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';
import 'package:widget_launcher/controllers/weather_controller.dart';

class AndroidAppMenuWeatherWidget extends StatelessWidget {
  const AndroidAppMenuWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherController>(
      builder: (weatherControllerContext) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  weatherControllerContext.location,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '(${weatherControllerContext.description})',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context)
                            .extension<ExtensionsThemeData>()!
                            .warning,
                      ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/${weatherControllerContext.icon}.png',
                  width: 60,
                  height: 60,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    weatherControllerContext.temperature,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Humidity: ${weatherControllerContext.humidity}',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Theme.of(context)
                                  .extension<ExtensionsThemeData>()!
                                  .warning,
                            ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Wind: ${weatherControllerContext.wind}',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Theme.of(context)
                                  .extension<ExtensionsThemeData>()!
                                  .warning,
                            ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'S Level: ${weatherControllerContext.seaLevel}',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Theme.of(context)
                                  .extension<ExtensionsThemeData>()!
                                  .warning,
                            ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'G Level: ${weatherControllerContext.groundLevel}',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Theme.of(context)
                                  .extension<ExtensionsThemeData>()!
                                  .warning,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
