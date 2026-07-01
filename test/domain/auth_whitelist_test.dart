import 'package:flutter_test/flutter_test.dart';
import 'package:ytdash_flutter/domain/auth/auth_whitelist.dart';

void main() {
  const whitelist = ['elaine.batista1105@gmail.com', 'edbpmc@gmail.com'];

  test('authorized email on the whitelist is allowed', () {
    expect(isAuthorized('edbpmc@gmail.com', whitelist), isTrue);
  });

  test('email not on the whitelist is denied', () {
    expect(isAuthorized('someone.else@gmail.com', whitelist), isFalse);
  });

  test('whitelist match is case-insensitive and trims whitespace', () {
    expect(isAuthorized('  EdBpmc@Gmail.com  ', whitelist), isTrue);
  });

  test('empty whitelist denies everyone', () {
    expect(isAuthorized('edbpmc@gmail.com', const []), isFalse);
  });
}
