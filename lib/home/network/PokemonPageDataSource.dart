abstract class LocalDataSource<T> {
  bool contains(int index);

  Future<T> get(int index);

  void store(int index, T item);
}
