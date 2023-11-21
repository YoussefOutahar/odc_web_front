import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TabTile extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const TabTile({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  State<TabTile> createState() => _TabTileState();
}

class _TabTileState extends State<TabTile> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _hovering = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.text,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return MouseRegion(
            onEnter: (_) {
              _controller.forward();
              setState(() {
                _hovering = true;
              });
            },
            onExit: (_) {
              _controller.reverse();
              setState(() {
                _hovering = false;
              });
            },
            child: GestureDetector(
              onTap: widget.onTap,
              child: Container(
                margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
                padding: const EdgeInsets.only(right: 5, top: 5, bottom: 5),
                child: Column(
                  children: [
                    Text(
                      widget.text,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 15),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: _hovering ? 30 : 30 * _animation.value,
                      height: 4,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(4)),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
