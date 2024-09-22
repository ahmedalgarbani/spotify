import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify/features/authentiaction/data/services/service_locator.dart';
import 'package:spotify/features/pages/usecase/addorremoveusecase.dart';

part 'favoritebutton_state.dart';

class FavoritebuttonCubit extends Cubit<FavoritebuttonState> {
  FavoritebuttonCubit() : super(FavoritebuttonInitial());

  void favoritebuttonUpdate(String songId) async {
    var result = await sl<AddOrRemoveUseCase>().call(params: songId);
    result.fold((l) {}, (isFavorite) {
      emit(FavoritebuttonUpdated(isFavorite: isFavorite));
    });
  }
}
