abstract class UseCase<Type, Request> {
  Future<Type> call({Request request});
}
