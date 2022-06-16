import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/features/goal/goal_input_sheet.dart';
import 'package:in_100_days/features/home/state_notifier.dart';
import 'package:in_100_days/features/records/record_list_page.dart';

class AppHome extends HookConsumerWidget {
  final User user;
  const AppHome({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = _userColor();
    if (color == null) {
      return _build(context, ref);
    } else {
      return Theme(
          data: ThemeData(primaryColor: color), child: _build(context, ref));
    }
  }

  Color? _userColor() {
    final colorString = user.colorString;
    if (colorString == null) {
      return null;
    }

    try {
      String valueString = colorString.split('(0x')[1].split(')')[0];
      int colorValue = int.parse(valueString, radix: 16);
      return Color(colorValue);
    } catch (_) {
      return null;
    }
  }

  Widget _build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateNotifierProvider(user));
    return state.when(
        data: (state) {
          if (state.goals.isEmpty) {
            Future.microtask(() {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: false,
                enableDrag: false,
                builder: (context) {
                  return GoalInputSheet(user: state.user);
                },
              );
            });
            return Container();
          } else {
            return RecordListPage(goal: state.goals.last);
          }
        },
        error: (error, _) => ErrorPage(error: error),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
