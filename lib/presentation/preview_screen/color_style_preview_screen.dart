import 'package:flutter/material.dart';
import 'package:tadaktak_app/core/styles/color_styles.dart';

class ColorStylesPreviewScreen extends StatelessWidget {
  const ColorStylesPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final groupedColors = <String, List<Map<String, dynamic>>>{
      'Black & White': [
        {'label': 'black', 'color': ColorStyles.black},
        {'label': 'black100', 'color': ColorStyles.black100},
        {'label': 'bcWhite', 'color': ColorStyles.bcWhite},
        {'label': 'white', 'color': ColorStyles.white},
        {'label': 'white20', 'color': ColorStyles.white20},
      ],
      'Gray Scale': [
        {'label': 'gray50', 'color': ColorStyles.gray50},
        {'label': 'gray300', 'color': ColorStyles.gray300},
        {'label': 'gray400', 'color': ColorStyles.gray400},
        {'label': 'gray800', 'color': ColorStyles.gray800},
        {'label': 'gray900', 'color': ColorStyles.gray900},
      ],
      'Blue': [
        {'label': 'blue100', 'color': ColorStyles.blue100},
      ],
      'Purple': [
        {'label': 'purple100', 'color': ColorStyles.purple100},
        {'label': 'purple200', 'color': ColorStyles.purple200},
        {'label': 'purple300', 'color': ColorStyles.purple300},
        {'label': 'purple500', 'color': ColorStyles.purple500},
        {'label': 'purple900', 'color': ColorStyles.purple900},
      ],
      'Red & Pink': [
        {'label': 'red100', 'color': ColorStyles.red100},
        {'label': 'pink100', 'color': ColorStyles.pink100},
      ],
      'Yellow': [
        {'label': 'yellow100', 'color': ColorStyles.yellow100},
      ],
      'Semantic (Alias)': [
        {'label': 'borderLight', 'color': ColorStyles.borderLight},
        {'label': 'elementsGray', 'color': ColorStyles.elementsGray},
        {'label': 'textBlack', 'color': ColorStyles.textBlack},
      ],
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Color Styles Preview')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children:
            groupedColors.entries.map((entry) {
              final groupName = entry.key;
              final colors = entry.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    groupName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children:
                        colors.map((item) {
                          final color = item['color'] as Color;
                          final textColor =
                              color.computeLuminance() < 0.5
                                  ? Colors.white
                                  : Colors.black;

                          return Container(
                            width: MediaQuery.of(context).size.width / 2 - 24,
                            height: 60,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                item['label'],
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 24),
                ],
              );
            }).toList(),
      ),
    );
  }
}
