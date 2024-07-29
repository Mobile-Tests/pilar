import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class MovieTopic extends StatelessWidget {
  const MovieTopic({
    super.key,
    required this.title,
    this.labels,
    this.onIndexChanged,
    required this.carousel,
  });

  final String title;
  final List<String>? labels;
  final ValueChanged<int>? onIndexChanged;
  final Widget carousel;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: x4),
          child: Text(
            title,
            style: appTheme.theme.textTheme.titleMedium?.copyWith(
              color: appTheme.colorScheme.primary,
            ),
          ),
        ),
        if (labels != null && labels!.isNotEmpty) const SizedBox(height: x2),
        if (labels != null && labels!.isNotEmpty)
          _ToggleSwitch(
            labels: labels!,
            initialLabelIndex: 0,
            onIndexChanged: onIndexChanged,
          ),
        const SizedBox(height: x4),
        SizedBox(
          height: 350,
          child: carousel,
        ),
      ],
    );
  }
}

class _ToggleSwitch extends StatefulWidget {
  const _ToggleSwitch({
    required this.labels,
    required this.initialLabelIndex,
    required this.onIndexChanged,
  });

  final List<String> labels;
  final int initialLabelIndex;
  final ValueChanged<int>? onIndexChanged;

  @override
  State<_ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<_ToggleSwitch> {
  late int _selectedIndex = widget.initialLabelIndex;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Row(
      children: [
        const Spacer(),
        Flexible(
          child: SizedBox(
            height: x10,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.labels.length,
              separatorBuilder: (context, index) => const SizedBox(width: x2),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                      if (widget.onIndexChanged != null) {
                        widget.onIndexChanged!(index);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: x2),
                    decoration: BoxDecoration(
                      color: index == _selectedIndex
                          ? appTheme.colorScheme.primary
                          : appTheme.colorScheme.backgroundContainer,
                      borderRadius: BorderRadius.circular(x6),
                      border: Border.all(
                        color: appTheme.colorScheme.primary,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.labels[index],
                        style: appTheme.theme.textTheme.labelMedium?.copyWith(
                          color: index == _selectedIndex
                              ? appTheme.colorScheme.backgroundContainer
                              : appTheme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: x2),
      ],
    );
  }
}
