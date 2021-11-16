import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:adoption_app/core/error/failures.dart';
import 'package:adoption_app/core/style/colors.dart';
import 'package:adoption_app/core/style/dimens.dart';
import 'package:adoption_app/core/style/duration.dart';
import 'package:adoption_app/core/style/text_styles.dart';

void notification({
  required final String description,
  final Color backgroundColor = CustomColors.blackColor,
}) =>
    BotToast.showNotification(
      title: (final _) => Text(
        description,
        style: roboto.s16.colorWhite.h13,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: backgroundColor.withOpacity(0.8),
      contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
      borderRadius: Dimens.buttonRadius,
      duration: Durations.notificationDuration,
    );

void errorNotification({
  required final Failure failure,
  final Color backgroundColor = CustomColors.blackColor,
}) =>
    notification(
      description: failure.errorMessage,
      backgroundColor: backgroundColor,
    );
