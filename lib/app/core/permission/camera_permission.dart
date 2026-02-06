import '../result/result.dart';

class CameraPermission {
  Future<Result<void>> request() async {
    // real app: permission_handler
    return const Success(null);
  }
}
