import 'package:flutter/material.dart';

class PlayPause extends StatefulWidget {
  final Function() startStop;
  final Function(TapDownDetails)? onTapDown;
  const PlayPause({Key? key, required this.startStop, this.onTapDown})
      : super(key: key);

  @override
  State<PlayPause> createState() => _PlayPauseState();
}

class _PlayPauseState extends State<PlayPause>
    with SingleTickerProviderStateMixin {
  bool isPlay = false;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
  }

  void _handleOnPressed() {
    setState(() {
      isPlay = !isPlay;
      isPlay ? _animationController.forward() : _animationController.reverse();
      widget.startStop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTapDown,
      onTap: _handleOnPressed,
      child: Container(
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: AnimatedIcon(
            icon: AnimatedIcons.pause_play,
            progress: _animationController,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
