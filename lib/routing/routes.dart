abstract final class Routes {
  static const todos = '/todos';
  static String todoDetails(String todoId) => '$todos/$todoId';
}
