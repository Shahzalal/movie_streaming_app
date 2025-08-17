import 'package:get/get.dart';

import '../../../domain/entities/models/accounts_tab.dart';

class AccountController extends GetxController {
  AccountModel account = AccountModel.initial();

  void addFavorite(String movie) {
    final updatedList = List<String>.from(account.favoriteMovies);
    if (!updatedList.contains(movie)) {
      updatedList.add(movie);
      account = account.copyWith(favoriteMovies: updatedList);
      update();
    }
  }

  void removeFavorite(String movie) {
    final updatedList = List<String>.from(account.favoriteMovies)..remove(movie);
    account = account.copyWith(favoriteMovies: updatedList);
    update();
  }

  void removeDownload(String movie) {
    final updatedList = List<String>.from(account.downloads)..remove(movie);
    account = account.copyWith(downloads: updatedList);
    update();
  }

  void toggleGenre(String genre) {
    final updatedList = List<String>.from(account.selectedGenres);
    if (updatedList.contains(genre)) {
      updatedList.remove(genre);
    } else {
      updatedList.add(genre);
    }
    account = account.copyWith(selectedGenres: updatedList);
    update();
  }

  void toggleSubscription() {
    account = account.copyWith(isSubscribed: !account.isSubscribed);
    update();
  }

  void activateSubscription() {
    account = account.copyWith(isSubscribed: true);
    update();
  }

  void cancelSubscription() {
    account = account.copyWith(isSubscribed: false);
    update();
  }
}
