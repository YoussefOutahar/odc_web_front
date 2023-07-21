import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Services/Utils/responsive.dart';
import '../Animations/delayed_widget.dart';
import '../Animations/entrance_fader.dart';
import 'Components/tab_tile.dart';

class Header extends StatefulWidget {
  const Header({super.key, required this.openDrawer});

  final VoidCallback openDrawer;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Responsive.isMobile(context)
              ? IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: widget.openDrawer,
                  icon: const Icon(Icons.menu),
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          const Spacer(),
          !Responsive.isMobile(context)
              ? Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DelayedWidget(
                        delayDuration: const Duration(milliseconds: 800),
                        child: TabTile(
                            text: "Home",
                            onTap: () => Get.offAndToNamed("/home")),
                      ),
                      DelayedWidget(
                        delayDuration: const Duration(milliseconds: 900),
                        child: TabTile(
                            text: "About",
                            onTap: () => Get.toNamed("/aboutUs")),
                      ),
                      DelayedWidget(
                        delayDuration: const Duration(milliseconds: 1000),
                        child: TabTile(
                            text: "Formations",
                            onTap: () => Get.toNamed("/formations")),
                      ),
                      DelayedWidget(
                        delayDuration: const Duration(milliseconds: 1100),
                        child: TabTile(
                            text: "Blog", onTap: () => Get.toNamed("/blog")),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ElevatedButton(
                onPressed: () => Get.toNamed("/contactUs"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text("Let's Talk")),
          ),
        ],
      ),
    );
  }
}

// class NavBarActionButton extends StatefulWidget {
//   const NavBarActionButton({
//     Key? key,
//     required this.label,
//     required this.index,
//   }) : super(key: key);

//   final String label;
//   final int index;
//   @override
//   State<NavBarActionButton> createState() => _NavBarActionButtonState();
// }

// class _NavBarActionButtonState extends State<NavBarActionButton> {
//   bool isHover = false;
//   @override
//   Widget build(BuildContext context) {
//     // theme
//     var theme = Theme.of(context);
//     return EntranceFader(
//       offset: const Offset(0, -10),
//       delay: const Duration(milliseconds: 1000),
//       duration: const Duration(milliseconds: 250),
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 5),
//         decoration: BoxDecoration(
//           gradient: isHover
//               ? const LinearGradient(
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                   colors: [Color(0XFFaa367c), Color(0XFF4a2fbd)],
//                 )
//               : null,
//           borderRadius: BorderRadius.circular(5.0),
//         ),
//         child: InkWell(
//           onHover: (value) {
//             setState(() => isHover = value);
//           },
//           onTap: () {},
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: Text(
//               widget.label,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Header2 extends StatefulWidget {
//   const Header2({super.key});

//   @override
//   State<Header2> createState() => _Header2State();
// }

// class _Header2State extends State<Header2> with SingleTickerProviderStateMixin {
//   double? screenWidth;

//   bool _isExpanded = false;

//   AnimationController? controller;

//   @override
//   void initState() {
//     controller = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     screenWidth = MediaQuery.of(context).size.width;
//     return Container(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _isExpanded = !_isExpanded;
//                     if (_isExpanded) {
//                       controller!.forward();
//                     } else {
//                       controller!.reverse();
//                     }
//                   });
//                 },
//                 child: AnimatedIcon(
//                   icon: AnimatedIcons.menu_close,
//                   progress: controller!,
//                 ),
//               ),
//               Image.asset(
//                 'assets/images/logo.png',
//                 height: 50.0,
//               ),
//               TextButton(
//                 onPressed: () {
//                   // Handle login button pressed
//                 },
//                 child: const Text('Log In'),
//               ),
//             ],
//           ),
//           AnimatedCrossFade(
//             duration: const Duration(milliseconds: 300),
//             firstChild: Container(),
//             secondChild: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10.0),
//                     const Divider(),
//                     const SizedBox(height: 10.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         TabTile(
//                           text: 'Foramation',
//                           onTap: () {
//                             // Handle home button pressed
//                           },
//                         ),
//                         TabTile(
//                           text: 'Services',
//                           onTap: () {
//                             // Handle home button pressed
//                           },
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             // Handle about button pressed
//                           },
//                           child: const Text('About'),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             // Handle contact button pressed
//                           },
//                           child: const Text('Contact'),
//                         ),
//                       ],
//                     ),
//                   ],
//                 )),
//             crossFadeState: _isExpanded
//                 ? CrossFadeState.showSecond
//                 : CrossFadeState.showFirst,
//           ),
//         ],
//       ),
//     );
//   }
// }
