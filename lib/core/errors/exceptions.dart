/// Parent class for all the exceptions thrown by the App.
abstract class AppExecption implements Exception {}

/// This exception will be thrown in case of server failures in the data layer.
class ServerException implements AppExecption {}
