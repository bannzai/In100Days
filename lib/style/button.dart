import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:in_100_days/style/color.dart';

class PrimaryButton extends HookWidget {
  final String text;
  final Future<void> Function()? onPressed;

  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isProcessing = useState(false);

    return ElevatedButton(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxHeight: 44, minHeight: 44, minWidth: 180, maxWidth: 180),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            if (isProcessing.value) _Loading(),
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        minimumSize: const Size.fromHeight(44),
      ),
      onPressed: onPressed == null
          ? null
          : () async {
              if (isProcessing.value) {
                return;
              }
              isProcessing.value = true;

              try {
                await onPressed?.call();
              } catch (error) {
                rethrow;
              } finally {
                isProcessing.value = false;
              }
            },
    );
  }
}

class TwitterLikeButton extends StatelessWidget {
  final String text;
  final Future<void> Function()? onPressed;

  const TwitterLikeButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isProcessing = useState(false);

    return ElevatedButton(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxHeight: 44, minHeight: 44, minWidth: 180, maxWidth: 180),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            if (isProcessing.value) _Loading(),
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: AppColor.twitterAppColor,
        minimumSize: const Size.fromHeight(44),
      ),
      onPressed: onPressed == null
          ? null
          : () async {
              if (isProcessing.value) {
                return;
              }
              isProcessing.value = true;

              try {
                await onPressed?.call();
              } catch (error) {
                rethrow;
              } finally {
                isProcessing.value = false;
              }
            },
    );
  }
}

class AppTextButton extends HookWidget {
  final Text text;
  final Future<void> Function()? onPressed;

  const AppTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isProcessing = useState(false);
    return SizedBox(
      height: 44,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            text,
            if (isProcessing.value) _Loading(),
          ],
        ),
        onPressed: isProcessing.value || onPressed == null
            ? null
            : () async {
                if (isProcessing.value) {
                  return;
                }
                isProcessing.value = true;

                try {
                  await onPressed?.call();
                } catch (error) {
                  rethrow;
                } finally {
                  isProcessing.value = false;
                }
              },
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 1,
        valueColor: AlwaysStoppedAnimation(Colors.grey),
      ),
    );
  }
}
