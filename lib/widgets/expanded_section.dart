import 'package:flutter/material.dart';

class ExpandedSection extends StatefulWidget {
  final Widget child;
  final bool isExpanded;

  const ExpandedSection({Key key, this.isExpanded, this.child})
      : super(key: key);

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    Animation curve = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    animation = Tween(begin: 1.0, end: 0.0).animate(curve)..addListener(() {});
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(sizeFactor: animationController, child: widget.child);
  }
}
