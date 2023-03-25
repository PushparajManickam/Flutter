# GoRoutre

### [Material route]('https://pub.dev/documentation/go_router/latest/topics/Get%20started-topic.html)

`return MaterialApp.router(
      routerConfig: _router,
    );`

### [Route config]('https://pub.dev/documentation/go_router/latest/topics/Configuration-topic.html)

- Initial Route assign to splash screen

```
 GoRouter(
  initialRoute: '/splashscreen',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
```

- [Logging]('https://pub.dev/documentation/go_router/latest/topics/Configuration-topic.html')

Enable the debugLogDiagnostics parameter

```
final _router = GoRouter(
  routes: [/* ... */],
  debugLogDiagnostics: true,
);
```

- **ShellRoute**

Display destinations in a subsection of the screen.</br>
Example : BottomNavigationBar that stays on-screen when navigating between destinations.

```
ShellRoute(
  builder:
      (BuildContext context, GoRouterState state, Widget child) {
    return Scaffold(
      body: child,
      /* ... */
      bottomNavigationBar: BottomNavigationBar(
      /* ... */
      ),
    );
  },
  routes: <RouteBase>[
    GoRoute(
      path: 'details',
      builder: (BuildContext context, GoRouterState state) {
        return const DetailsScreen();
      },
    ),
  ],
),
```
