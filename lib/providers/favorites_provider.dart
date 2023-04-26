import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  //super općenito koristimo da dokučimo parent classu
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      //.add(ista memorija objekta nakon akcije) ili .remove(ista memorija objekta nakon akcije) ne možemo korisitit pošto moramo uvijek novu listu korisitit (nova memorija)
      //where nam daje novu listu
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [
        ...state,
        meal
      ]; //dodajemo u novu listu postojeće meal-ove u favoritima + dodajemo "novi" meal u listu
      return true;
    }
  }
}

//StateNotifierProvider() optimizirana za podatke koje se mijenjaju dok Provider je sa statičku bazu
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
