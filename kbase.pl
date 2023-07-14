servesAll(meaty, [steak, burgers, larb, gyros]).
servesAll(american, [salad, steak, sandwiches, burgers, fried_chicken]).
servesAll(burger_place, [burgers, fries, onion_rings]).
servesAll(chinese, [eggrolls, rice, shrimp, soup, noodles]).
servesAll(indian, [papadam, bagan_bharta, rice, tandoori, naan]).
servesAll(italian, [salad, pasta, cioppino, snapper, bread, garlic_bread]).
servesAll(japanese, [sashimi, rice, tempura, noodles]).
servesAll(mediterranean, [gyros, hummus, pita, falafel]).
servesAll(mexican, [tacos, beans, rice, enchiladas, fish_tacos]).
servesAll(pizza_place, [pizza, salad, garlic_bread]).
servesAll(thai, [rice, noodles, larb, pad_thai]).

/* (Question 3) Which kind of restaurants serve snapper?
        serves(X, snapper).
(Question 4) Which kinds of restaurants serves rice?
        serves(X, rice). */
serves(KindRestaurant, Dish) :- servesAll(KindRestaurant, Dishes), member(Dish, Dishes).


typeFoodAll(vegetarian, [beans, bagan_bharta, enchiladas, falafel, hummus, pizza, salad, soup, tempura, onion_rings, naan, papadam, bread, rice, noodles, pita, garlic_bread, pasta, fries]).
typeFoodAll(meat, [burgers, enchiladas, gyros, pad_thai, pizza, steak, sandwiches, fried_chicken, tacos, tandoori, larb]).
typeFoodAll(seafood, [snapper, cioppino, sashimi, shrimp, clams, fish_tacos, tempura]).
typeFoodAll(starch, [naan, papadam, bread, rice, noodles, pita, garlic_bread, pasta, fries]).

typeFood(KindFood, Dish) :- typeFoodAll(KindFood, Dishes), member(Dish, Dishes).


cuisineAll(meaty, [big_beefy]).
cuisineAll(american, [waterman_grille, red_stripe]).
cuisineAll(burger_place, [shake_shack]).
cuisineAll(chinese, [yans, chinatown]).
cuisineAll(indian, [kabob_n_curry]).
cuisineAll(italian, [pasta_beach, al_forno]).
cuisineAll(japanese, [haruki]).
cuisineAll(mediterranean, [andreas, east_side_pockets]).
cuisineAll(mexican, [bajas, dolores, tallulahs]).
cuisineAll(pizza_place, [pizza_marvin, mikes]).
cuisineAll(thai, [heng, bees, lims]).

/* (Question 2) Which restaurants have italian cuisine? 
        cuisine(italian, X). */
cuisine(KindRestaurant, Name) :- cuisineAll(KindRestaurant, Names), member(Name, Names).


locationAll(thayer_street, [yans, bajas, andreas, chinatown, kabob_n_curry, heng, mikes, east_side_pockets, shake_shack]).
locationAll(fox_point, [big_beefy, pizza_marvin, dolores, tallulahs, bees, al_forno]).
locationAll(wayland, [waterman_grille, red_stripe, pasta_beach, haruki, lims]).

/* (Question 1) Which restaurants are in Wayland? 
        location(Wayland, X). */ 
location(Street, Name) :- locationAll(Street, Names), member(Name, Names).

containsVegetarian(KindRestaurant) :- serves(KindRestaurant, Dish), typeFood(vegetarian, Dish).
containsMeat(KindRestaurant) :- serves(KindRestaurant, Dish), typeFood(meat, Dish).

/* (Question 5) Where can you get served a vegetarian dish in fox_point? 
        vegetarianLocation(X, fox_point). */
vegetarianLocation(Name, Street) :- location(Street, Name), cuisine(KindRestaurant, Name), containsVegetarian(KindRestaurant).

/* (Question 6) Which restaurants serve both vegetarian and meat dishes? 
        servesBoth(X). */
servesBoth(Name) :- cuisine(KindRestaurant, Name), containsVegetarian(KindRestaurant), containsMeat(KindRestaurant).

/* (Question 7) Which areas have both a chinese restaurant and a mexican restaurant? 
        multiCuisine(X, chinese, mexican). */
containsCuisine(Street, KindRestaurant) :- location(Street, Name), cuisine(KindRestaurant, Name).
multiCuisine(Street, Cuisine1, Cuisine2) :- containsCuisine(Street, Cuisine1), containsCuisine(Street, Cuisine2).