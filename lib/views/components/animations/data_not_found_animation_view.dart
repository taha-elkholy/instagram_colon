import 'package:instagram_colon/views/components/animations/lottie_animation_view.dart';
import 'package:instagram_colon/views/components/animations/models/lottie_animation.dart';

class DataNotFoundAnimationView extends LottieAnimationView {
  const DataNotFoundAnimationView({super.key})
      : super(
          animation: LottieAnimation.dataNotFound,
        );
}