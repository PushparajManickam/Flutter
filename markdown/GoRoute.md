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
- Navigation

 context.go(),

`` GoRouter.of(context).go('/users/123). ``

To build a URI with query parameters,

`` context.go(Uri(path: '/users/123', queryParameters: {'filter': 'abc'}).toString());``
- Named routes

Instead of navigating to a route based on the URL, a GoRoute can be given a unique name. To configure a named route, use the name parameter:
```
GoRoute(
   name: 'song',
   path: 'songs/:songId',
   builder: /* ... */,
 ),
 ```
 **goName** 

 > context.goNamed('song', params: {'songId': 123}); 

**namedLocation** 

 > final String location = context.namedLocation('song', params: {'songId': 123});
    context.go(location);
- [Redirection]('https://pub.dev/documentation/go_router/latest/topics/Redirection-topic.html')

Redirection changes the location to a new one based on application state. For example, redirection can be used to display a sign-in screen if the user is not logged in.

```
redirect: (BuildContext context, GoRouterState state) {
  if (AuthState.of(context).isSignedIn) {
    return '/signin';
  } else {
    return null;
  }   
},
```
Types of redirection:

**Top-level redirection:** Defined on the GoRouter constructor. Called before any navigation event.

**Route-level redirection:** Defined on the GoRoute constructor. Called when a navigation event is about to display the route.

- Redirecting to a named route

```
redirect: (BuildContext context, GoRouterState state) {
  if (AuthState.of(context).isSignedIn) {
    return context.namedLocation('signIn');
  } else {
    return null;
  }   
},
```

- [Transition animations topic]("https://pub.dev/documentation/go_router/latest/topics/Transition%20animations-topic.html")

To configure provide a **pageBuilder** parameter to the goRooute  constructor.
```
GoRoute(
  path: 'details',
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: DetailsScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Change the opacity of the screen using a Curve based on the the animation's
        // value
        return FadeTransition(
          opacity:
              CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  },
),
```
[Transaction animations sample]("https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/transition_animations.dart)

- [Error Handling]('https://pub.dev/documentation/go_router/latest/topics/Error%20handling-topic.html')

By default, go_router comes with default error screens for both MaterialApp and CupertinoApp as well as a default error screen in the case that none is used

```
GoRouter(
  /* ... */
  errorBuilder: (context, state) => ErrorScreen(state.error),
);
```


- [Type safe routes]('https://pub.dev/documentation/go_router/latest/topics/Type-safe%20routes-topic.html')
--[Deep Linking]('https://pub.dev/documentation/go_router/latest/topics/Deep%20linking-topic.html')