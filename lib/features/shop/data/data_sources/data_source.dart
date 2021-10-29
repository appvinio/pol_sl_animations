abstract class DataSource {
  Future function();
}

class DataSourceImpl extends DataSource {
  DataSourceImpl({required final this.source});

  final source;

  @override
  Future function() {
    // TODO - implement function
    throw UnimplementedError();
  }
}
