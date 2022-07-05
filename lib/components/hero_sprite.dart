import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class HeroSprite extends SpriteAnimationComponent {
  HeroSprite() : super(size: Vector2(50, 50), anchor: Anchor.center);

  @override
  Future<void>? onLoad() async {
    List<Sprite> sprites = [];

    for (int i = 1; i <= 16; i++) {
      sprites.add(await Sprite.load('sprite/Idle ($i).png'));
    }

    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.03);
    add(RectangleHitbox()..debugMode = true);
  }

  double speed = 200.0;

  void move(Vector2 ds){
    position.add(ds);
    print(ds);
  }

  void rotateTo(double deg){
    angle=deg;
  }
}
