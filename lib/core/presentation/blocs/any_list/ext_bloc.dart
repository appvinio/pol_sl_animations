part of 'any_list_bloc.dart';

abstract class ExtBloc<E, S> extends Bloc<E, S> {
  ExtBloc(final S initialState) : super(initialState);

  bool disposed = false;

  @override
  Future<void> close() {
    disposed = true;
    Fimber.d("ExtBloc is DISPOSED!!!");
    return super.close();
  }
}
