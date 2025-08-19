import 'package:flutter/material.dart';

class CoffeeParallaxCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final double price;
  final double rating;

  const CoffeeParallaxCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // الصورة مع Parallax
            _ParallaxImage(imageUrl: imageUrl),

            // باقي المحتوى
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 160), // نفس ارتفاع الصورة
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ ${price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // التقييم في الأعلى
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 2),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ويدجت خاصة بالـ Parallax
class _ParallaxImage extends StatelessWidget {
  final String imageUrl;

  const _ParallaxImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final scrollable = Scrollable.of(context);
    final scrollPosition = scrollable?.position;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Flow(
          delegate: _ParallaxFlowDelegate(
            scrollable: scrollable!,
            listItemContext: context,
            imageHeight: 220, // أكبر من الكارت باش يبان التأثير
          ),
          children: [Image.asset(imageUrl, fit: BoxFit.cover)],
        );
      },
    );
  }
}

class _ParallaxFlowDelegate extends FlowDelegate {
  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final double imageHeight;

  _ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.imageHeight,
  }) : super(repaint: scrollable.position);

  @override
  void paintChildren(FlowPaintingContext context) {
    // موقع الكارت في الشاشة
    final scrollBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollBox,
    );

    // نسبة التمركز
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction = (listItemOffset.dy / viewportDimension).clamp(
      0.0,
      1.0,
    );

    // حركة الصورة (Parallax)
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    final transform = Matrix4.translationValues(
      0,
      -(imageHeight - context.size.height) / 2 * verticalAlignment.y,
      0,
    );

    context.paintChild(0, transform: transform);
  }

  @override
  bool shouldRepaint(covariant _ParallaxFlowDelegate oldDelegate) {
    return oldDelegate.scrollable != scrollable ||
        oldDelegate.listItemContext != listItemContext ||
        oldDelegate.imageHeight != imageHeight;
  }
}
