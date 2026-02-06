import '../../../../app/core/result/result.dart';
import '../../../../app/core/usecase/usecase.dart';

class TakePhotoUseCase extends UseCase<String, NoParams> {
  @override
  Future<Result<String>> call(NoParams params) async {
    // real: permission + image_picker
    return const Success('/tmp/image.jpg');
  }
}
