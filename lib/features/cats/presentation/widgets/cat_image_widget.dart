import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed_image.dart';
import 'package:aplikacja_sklep/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CatImageWidget extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  CatImageWidget({
    required this.catBreedImage,
    required this.height,
    Key? key,
  }) : super(key: key);

  final CatBreedImage? catBreedImage;
  final double height;

  @override
  State<CatImageWidget> createState() => _CatImageWidgetState();
}

class _CatImageWidgetState extends State<CatImageWidget> {
  final GlobalKey imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: Flow(
          delegate: _ParallaxFlowDelegate(
            scrollable: Scrollable.of(context),
            listItemContext: context,
            backgroundImageKey: imageKey,
            imageHeight: widget.catBreedImage?.height?.toDouble() ?? 0,
          ),
          children: [
            SizedBox(
              key: imageKey,
              height: widget.height * 1.5,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: CustomColors.refreshIndicator
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Assets.images.catPlaceholder
                            .svg(color: CustomColors.primary),
                      ),
                    ),
                  ),
                  if (widget.catBreedImage?.url?.isNotEmpty ?? false)
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: double.infinity,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: widget.catBreedImage?.url ?? 'https',
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ParallaxFlowDelegate extends FlowDelegate {
  _ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
    required this.imageHeight,
  }) : super(repaint: scrollable?.position);

  final ScrollableState? scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;
  final double imageHeight;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    if (scrollable != null) {
      /// Calculate the position of this list item within the viewport.
      final scrollableBox =
          scrollable!.context.findRenderObject()! as RenderBox;
      final listItemBox = listItemContext.findRenderObject()! as RenderBox;
      final listItemOffset = listItemBox.localToGlobal(
          listItemBox.size.centerLeft(Offset.zero),
          ancestor: scrollableBox);

      /// Determine the percent position of this list item within the
      /// scrollable area.
      final viewportDimension = scrollable!.position.viewportDimension;
      final scrollFraction =
          (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

      /// Calculate the vertical alignment of the background
      /// based on the scroll percentage.
      final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

      /// Convert the background alignment into a pixel offset for
      /// painting purposes.
      final backgroundSize =
          (backgroundImageKey.currentContext!.findRenderObject()! as RenderBox)
              .size;
      final listItemSize = context.size;
      final childRect = verticalAlignment.inscribe(
          backgroundSize, Offset.zero & listItemSize);

      /// Paint the background.
      context.paintChild(
        0,
        transform: Transform.translate(
          offset: Offset(0.0, childRect.top),
        ).transform,
      );
    } else {
      context.paintChild(0);
    }
  }

  @override
  bool shouldRepaint(_ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
