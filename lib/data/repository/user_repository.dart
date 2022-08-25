abstract class UserRepository {
  Future<bool> signIn(String email, String password);
  Future<bool> signUp(String email, String password);
  logOut();
  forgetPassword(String email);
}
