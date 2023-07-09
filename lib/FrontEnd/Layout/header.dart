import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Animations/entrance_fader.dart';
import 'Components/tab_tile.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: const Image(
              image: AssetImage("assets/images/logo.png"),
              height: 50,
              filterQuality: FilterQuality.high,
              isAntiAlias: true,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              TabTile(text: "Home", onTap: () => Get.offAndToNamed("/home")),
              TabTile(text: "About", onTap: () => Get.toNamed("/aboutUs")),
              TabTile(
                  text: "Formations", onTap: () => Get.toNamed("/formations")),
              TabTile(text: "Blog", onTap: () => Get.toNamed("/blog")),
              TabTile(
                  text: "Contact Us", onTap: () => Get.toNamed("/contactUs")),
            ],
          ),
          const Spacer(),
          // AuthController.checkIfLogged() ? _buildLogged() : _buildNotLogged(),
        ],
      ),
    );
  }

  Widget _buildLogged() {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text(
            "Welcome Back",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildNotLogged() {
    return Row(
      children: [
        TabTile(
          text: "Login",
          onTap: () {
            Get.toNamed("/authenticate");
          },
        )
      ],
    );
  }
}

class NavBarActionButton extends StatefulWidget {
  const NavBarActionButton({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);

  final String label;
  final int index;
  @override
  State<NavBarActionButton> createState() => _NavBarActionButtonState();
}

class _NavBarActionButtonState extends State<NavBarActionButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    // theme
    var theme = Theme.of(context);
    return EntranceFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 1000),
      duration: const Duration(milliseconds: 250),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          gradient: isHover
              ? const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0XFFaa367c), Color(0XFF4a2fbd)],
                )
              : null,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: InkWell(
          onHover: (value) {
            setState(() => isHover = value);
          },
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              widget.label,
              style: TextStyle(color: theme.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}

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
