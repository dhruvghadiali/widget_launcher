import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:widget_launcher/theme/extensions_theme_data.dart';
import 'package:widget_launcher/controllers/weather_controller.dart';

class AndroidAppDraweWeatherWidget extends StatelessWidget {
  const AndroidAppDraweWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherController>(
      builder: (weatherControllerContext) {
        return Container(
          margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Row(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      weatherControllerContext.location,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          weatherControllerContext.temperature,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Theme.of(context)
                                        .extension<ExtensionsThemeData>()!
                                        .warning,
                                  ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Text(
                            weatherControllerContext.description,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Theme.of(context)
                                      .extension<ExtensionsThemeData>()!
                                      .warning,
                                ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
