/// Abstract class contain an abstract method
/// while implementing these class as interface we can override this method
abstract class BaseBloc {
  Stream<ScreenStatus> get screenStatus;

  ScreenStatus get getScreenStatus;

  Function(ScreenStatus) get changeScreenStatus;

  void dispose();
}

// Define all possible states for the auth form.
enum ScreenStatus { ready, loading, noInternet, success, error }
