import 'package:shop_app/models/change_favorites.dart';

abstract class HomeStates {}

class InitialState extends HomeStates {}

// change bottomnavigationbar state
class ChangeBottomNavState extends HomeStates {}

// Home data states
class HomeLoadingState extends HomeStates {}

class SuccessGetHomeState extends HomeStates {}

class ErorrGetHomeState extends HomeStates {
  final String error;
  ErorrGetHomeState(this.error);
}

// get Categroy data
class GetCategroyLoadingState extends HomeStates {}

class SuccessGetCategroyeState extends HomeStates {}

class ErorrGetCategroyState extends HomeStates {
  final String error;
  ErorrGetCategroyState(this.error);
}
// change favorites states

class ChangeFavoritesState extends HomeStates {}

class SuccessChangeFavoritesState extends HomeStates {
  final ChangeFavoritesModel model;

  SuccessChangeFavoritesState(this.model);
}

class ErorrChangeFavoritesState extends HomeStates {
  final String error;
  ErorrChangeFavoritesState(this.error);
}

//get favorites states
class GetFavoritesLoadingState extends HomeStates {}

class SuccessGetFavoriteseState extends HomeStates {}

class ErorrGetFavoritesState extends HomeStates {
  final String error;
  ErorrGetFavoritesState(this.error);
}
