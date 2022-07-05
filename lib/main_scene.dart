import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_game/components/hero_sprite.dart';

class MainScene extends FlameGame with HasDraggables {
  static const _imageAssets = [
    'parallax/plx-1.png',
    'parallax/plx-2.png',
    'parallax/plx-3.png',
    'parallax/plx-4.png',
    'parallax/plx-5.png',
    'parallax/plx-6.png',
  ];

  late final JoystickComponent joystick;
  late final HeroSprite heroSprite;


  @override
  Future<void>? onLoad() async {
    await Flame.images.loadAll(_imageAssets);

    camera.viewport = FixedResolutionViewport(Vector2(360, 180));
    heroSprite=HeroSprite();

    final parallaxBackground = await loadParallaxComponent(
      [
        ParallaxImageData('parallax/plx-1.png'),
        ParallaxImageData('parallax/plx-2.png'),
        ParallaxImageData('parallax/plx-3.png'),
        ParallaxImageData('parallax/plx-4.png'),
        ParallaxImageData('parallax/plx-5.png'),
        ParallaxImageData('parallax/plx-6.png'),
      ],
      baseVelocity: Vector2(10, 0),
      velocityMultiplierDelta: Vector2(1.4, 0),
    );
    add(parallaxBackground);
    add(heroSprite..position = Vector2(size[0] / 2, size[1] - 45));

    joystick = JoystickComponent(
        knob: CircleComponent(
            radius: 10, paint: BasicPalette.black.withAlpha(100).paint()),
        background: CircleComponent(
            radius: 30, paint: BasicPalette.black.withAlpha(100).paint()),
        margin: const EdgeInsets.only(left: 20, bottom: 40));

    add(joystick);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    print(dt);

    if(!joystick.delta.isZero()){
      Vector2 ds=joystick.relativeDelta*heroSprite.speed*dt;
      heroSprite.move(ds);
    }else{
      heroSprite.rotateTo(0);
    }
  }
}
