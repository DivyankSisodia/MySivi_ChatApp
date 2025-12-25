import 'package:flutter/material.dart';

class CustomSegmentedControl extends StatelessWidget {
  final int selectedIndex;
  final List<String> segments;
  final Function(int) onValueChanged;

  const CustomSegmentedControl({
    super.key,
    required this.selectedIndex,
    required this.segments,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200], // Matches iOS light gray background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Animated sliding thumb (white background)
          AnimatedAlign(
            alignment: selectedIndex == 0
                ? Alignment.centerLeft
                : Alignment.centerRight,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Container(
              width: (MediaQuery.of(context).size.width - 80) /
                  2, // Adjust based on parent width; we'll constrain it
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
          // Tap targets and text
          Row(
            children: segments.asMap().entries.map((entry) {
              int index = entry.key;
              String text = entry.value;

              return Expanded(
                child: GestureDetector(
                  onTap: () => onValueChanged(index),
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: selectedIndex == index
                            ? Colors.black87 // Selected: dark text
                            : Colors.black54, // Unselected: gray
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}