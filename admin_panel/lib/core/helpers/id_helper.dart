import 'package:uuid/uuid.dart';

class IDProvider {
  static Uuid _uuid = const Uuid();

  static get id => _uuid.v4();
}
