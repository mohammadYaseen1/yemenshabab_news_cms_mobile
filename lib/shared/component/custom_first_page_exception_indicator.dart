import 'package:flutter/material.dart';

class CustomFirstPageExceptionIndicator extends StatelessWidget {
  const CustomFirstPageExceptionIndicator({
    required this.title,
    required this.buttonTitle,
    this.message,
    this.onTryAgain,
    super.key,
  });

  final String title;
  final String buttonTitle;
  final String? message;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    final message = this.message;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (message != null)
              const SizedBox(
                height: 16,
              ),
            if (message != null)
              Text(
                message,
                textAlign: TextAlign.center,
              ),
            if (onTryAgain != null)
              const SizedBox(
                height: 48,
              ),
            if (onTryAgain != null)
              SizedBox(
                height: 50,
                width: double.infinity,
                child: FilledButton.icon(
                  style: const ButtonStyle(
                      // backgroundColor: WidgetStateProperty.all(Theme.of(context).cardColor),
                      // foregroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
                      ),
                  onPressed: onTryAgain,
                  icon: const Icon(
                    Icons.refresh,
                  ),
                  label: Text(
                    buttonTitle,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
