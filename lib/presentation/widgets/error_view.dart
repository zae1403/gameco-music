import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.child,
    this.onRefresh,
  });
  final Widget child;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultTextStyle(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!,
              child: child,
            ),
            if (onRefresh != null)
              TextButton(
                onPressed: onRefresh,
                child: const Text('Refresh'),
              )
          ],
        ),
      ),
    );
  }
}
