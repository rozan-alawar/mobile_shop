import 'package:mobile_shop/data/Repository/user_repository.dart';

class TestRepository extends UserRepository {
  static final TestRepository instance = TestRepository._();

  TestRepository._();
  @override
  forgetPassword(String email) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  logOut() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  Future<bool> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  Future<bool> signUp(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
