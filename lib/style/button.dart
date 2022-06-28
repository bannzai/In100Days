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
    var isProcessing = false;

    return ElevatedButton(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 17,
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(44)),
          backgroundColor: MaterialStateProperty.resolveWith((statuses) {
            if (statuses.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return AppColor.twitterAppColor;
          })),
      onPressed: onPressed == null
          ? null
          : () async {
              if (isProcessing) {
                return;
              }
              isProcessing = true;

              try {
                await onPressed?.call();
              } catch (error) {
                rethrow;
              } finally {
                isProcessing = false;
              }
            },
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
