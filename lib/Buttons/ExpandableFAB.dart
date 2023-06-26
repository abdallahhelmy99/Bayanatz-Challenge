import 'package:flutter/material.dart';
import 'package:native_screenshot/native_screenshot.dart';
import 'package:permission_handler/permission_handler.dart';

class ExpandableFloatingActionButton extends StatefulWidget {
  @override
  _ExpandableFloatingActionButtonState createState() =>
      _ExpandableFloatingActionButtonState();
}

class _ExpandableFloatingActionButtonState
    extends State<ExpandableFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (_isExpanded) ..._buildExpandedActions(),
        FloatingActionButton(
          backgroundColor: Colors.indigoAccent,
          onPressed: _toggleExpanded,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animation,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildExpandedActions() {
    return [
      // Add your custom actions here
      FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        onPressed: () {
          // Action 1
        },
        child: const Icon(Icons.email_outlined, color: Colors.white),
      ),
      const SizedBox(height: 16),
      FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        onPressed: () async {
          // Save screenshot to gallery - Save Receipt to internal storage
          String? path = await NativeScreenshot.takeScreenshot();
          debugPrint('Screenshot taken, path: $path');
        },
        child: const Icon(Icons.save_alt_outlined, color: Colors.white),
      ),
      const SizedBox(height: 16),
    ];
  }
}
