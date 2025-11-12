import 'package:flutter/material.dart';

class FeatureItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const FeatureItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  State<FeatureItem> createState() => _FeatureItemState();
}

class _FeatureItemState extends State<FeatureItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: 80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFF8E2A7), Color(0xFFFFE4B5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: _isPressed
                    ? [
                        BoxShadow(
                          color: Colors.brown.withOpacity(0.2),
                          offset: const Offset(2, 2),
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.brown.withOpacity(0.4),
                          offset: const Offset(4, 4),
                          blurRadius: 6,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.8),
                          offset: const Offset(-3, -3),
                          blurRadius: 6,
                        ),
                      ],
              ),
              child: Icon(
                widget.icon,
                color: const Color(0xFF6B4226),
                size: 30,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.title,
              style: const TextStyle(
                color: Color(0xFF6B4226),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
