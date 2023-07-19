const _basePath = "assets/images/";
const _extensionPng = ".png";

enum Assets {
  icSecurity("ic_security", _extensionPng),
  loginLock("login_lock", _extensionPng);

  final String _path;
  final String _extension;

  const Assets(this._path, this._extension);

  String get path => _basePath + _path + _extension;
}
