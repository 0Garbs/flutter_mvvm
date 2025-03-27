import 'package:flutter_mvvm/data/repositories/todo/todo_repository_remote.dart';
import 'package:flutter_mvvm/data/services/api/api_client.dart';
import 'package:flutter_mvvm/routing/routes.dart';
import 'package:flutter_mvvm/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:flutter_mvvm/ui/todo/widgets/todo_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter routerConfig() {
  return GoRouter(
    initialLocation: Routes.todos,
    routes: [
      GoRoute(
        path: Routes.todos,
        builder: (context, state) => TodoScreen(
          todoViewmodel: TodoViewmodel(
            todosRepository: TodoRepositoryRemote(
              apiClient: ApiClient(host: '10.0.1.80'),
            ),
          ),
        ),
      ),
    ],
  );
}
