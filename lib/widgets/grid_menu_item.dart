import 'package:flutter/material.dart';

class GridMenuItem extends StatefulWidget {
  final String image;
  final String label;

  const GridMenuItem({
    super.key,
    required this.image,
    required this.label,
  });

  @override
  State<GridMenuItem> createState() => _GridMenuItemState();
}

class _GridMenuItemState extends State<GridMenuItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedScale(
        scale: _isHovering ? 1.07 : 1.0,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          decoration: BoxDecoration(
            // Warna background saat hover jadi biru muda
            color: _isHovering ? Colors.lightBlue.shade50 : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovering
                  ? const Color.fromARGB(255, 64, 148, 226).withOpacity(0.4)
                  : Colors.grey.shade200,
              width: 1.4,
            ),
            boxShadow: _isHovering
                ? [
                    BoxShadow(
                      color: const Color.fromARGB(255, 64, 148, 226)
                          .withOpacity(0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.image,
                width: 34,
                height: 34,
              ),
              const SizedBox(height: 10),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _isHovering
                      ? const Color.fromARGB(255, 64, 148, 226)
                      : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}