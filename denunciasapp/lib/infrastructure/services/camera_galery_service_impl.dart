import 'package:denunciasapp/infrastructure/services/camera_galery_service.dart';
import 'package:image_picker/image_picker.dart';

class CameraGaleryServiceImpl extends CameraGaleryService {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<String?> selectPhoto() async {
    final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        preferredCameraDevice: CameraDevice.rear);
    if (image == null) return null;
    return image.path;
  }

  @override
  Future<String?> takePhoto() async {
    final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        preferredCameraDevice: CameraDevice.rear);
    if (photo == null) return null;
    return photo.path;
  }
}
