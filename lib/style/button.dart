import 'package:flutter/material.dart';
import 'package:in_100_days/style/color.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Future<void> Function()? onPressed;

  const PrimaryButton({
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
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        minimumSize: const Size.fromHeight(44),
      ),
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
