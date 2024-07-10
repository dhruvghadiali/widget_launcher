// import 'package:flutter/material.dart';

// class AndroidApiRequestLoaderWidget extends StatelessWidget {
//   const AndroidApiRequestLoaderWidget({
//     super.key,
//     this.title,
//     this.message,
//     this.background,
//     this.foreground,
//   });

//   final String? title;
//   final String? message;
//   final Color? background;
//   final Color? foreground;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//         color: background ??
//             Theme.of(context).extension<ExtensionsThemeData>()!.warning,
//         border: Border(
//           right: BorderSide(
//             color: foreground ?? Theme.of(context).colorScheme.secondary,
//             width: 5,
//           ),
//         ),
//       ),
//       child: Row(
//         key: Key(rowForAndroidApiRequestLoaderWidget),
//         children: [
//           Container(
//             key: Key(loderContainerForAndroidApiRequestLoaderWidget),
//             height: 40,
//             width: 40,
//             color: foreground ?? Theme.of(context).colorScheme.secondary,
//             padding: const EdgeInsets.all(10),
//             child: AndroidLoaderWidget(
//               loaderColor: background ??
//                   Theme.of(context).extension<ExtensionsThemeData>()!.warning,
//             ),
//           ),
//           Expanded(
//             child: Container(
//               key: Key(loderMessageContainerForAndroidApiRequestLoaderWidget),
//               color: background ??
//                   Theme.of(context).extension<ExtensionsThemeData>()!.warning,
//               padding: const EdgeInsets.only(
//                 left: 10,
//               ),
//               child: Column(
//                 key: Key(columnForAndroidApiRequestLoaderWidget),
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title ??
//                         AppLocalizations.of(context)!.apiRequestProcessingTitle,
//                     style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontWeight: FontWeight.bold,
//                         ),
//                     textAlign: TextAlign.start,
//                   ),
//                   Text(
//                     message ??
//                         AppLocalizations.of(context)!
//                             .apiRequestProcessingMessage,
//                     style: Theme.of(context).textTheme.labelSmall,
//                     textAlign: TextAlign.start,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
