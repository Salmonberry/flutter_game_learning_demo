import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame_audio/flame_audio.dart';

class MainScene extends FlameGame {
  static const _imageAssets = [
    'DinoSprites - tard.sprite',
    'AngryPig/Walk (36x30).sprite',
    'Bat/Flying (46x30).sprite',
    'Rino/Run (52x34).sprite',
    'parallax/plx-1.sprite',
    'parallax/plx-2.sprite',
    'parallax/plx-3.sprite',
    'parallax/plx-4.sprite',
    'parallax/plx-5.sprite',
    'parallax/plx-6.sprite',
  ];

  @override
  Future<void>? onLoad() async {
    await Flame.images.loadAll(_imageAssets);

    camera.viewport = FixedResolutionViewport(Vector2(360, 180));

    final parallaxBackground = await loadParallaxComponent(
      [
        ParallaxImageData('parallax/plx-1.sprite'),
        ParallaxImageData('parallax/plx-2.sprite'),
        ParallaxImageData('parallax/plx-3.sprite'),
        ParallaxImageData('parallax/plx-4.sprite'),
        ParallaxImageData('parallax/plx-5.sprite'),
        ParallaxImageData('parallax/plx-6.sprite'),
      ],
      baseVelocity: Vector2(10, 0),
      velocityMultiplierDelta: Vector2(1.4, 0),
    );
    add(parallaxBackground);

    return super.onLoad();
  }


}
