import 'package:flutter/material.dart';

class AndroidAppMenuHeaderWidget extends StatelessWidget {
  const AndroidAppMenuHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      alignment: Alignment.bottomLeft,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 100,
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Dhruv',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        'Good Evening',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.filter_list_rounded),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
