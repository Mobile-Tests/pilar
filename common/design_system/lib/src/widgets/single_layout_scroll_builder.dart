import 'package:flutter/material.dart';

/// Used to build usually screen layouts that may or not be too large
/// (in height) and might need a scroll, but if not, keep the original
/// structure.
class SingleLayoutScrollBuilder extends LayoutBuilder {
  SingleLayoutScrollBuilder({
    super.key,
    required WidgetBuilder builder,
  }) : super(
          builder: (context, constraints) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: builder(context),
            ),
          ),
        );
}
