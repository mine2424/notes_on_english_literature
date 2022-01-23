enum AuthStatus {
  none,

  /// ログイン方法関連
  // email以外でログインした場合
  authenticated,

  // emailでログインした場合
  email,

  // googleでログインした場合
  google,

  // appleでログインした場合
  apple,

  /// エラー関連
  // 接続中
  waiting,

  // 何かしらんエラーが発生した場合
  error,

  // パスワードが弱い場合
  weakPassword,

  // emailが既に存在している場合
  emailAlreadyExists,
}
