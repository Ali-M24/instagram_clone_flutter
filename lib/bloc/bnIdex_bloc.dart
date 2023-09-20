import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instgram_clone/bloc/bnIdex_event.dart';
import 'package:instgram_clone/bloc/bnIdex_state.dart';

class BNIndexBloc extends Bloc<bnIndexEvent, bnIndexState> {
  BNIndexBloc() : super(bnIndexInitial(0)) {
    on<UpdateBNIndex>((event, emit) {
      emit(bnIndex(event.newIndex));
    });
  }
}
