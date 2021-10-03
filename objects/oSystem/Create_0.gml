/// @description Initialize world
randomize();

enum SEEDS
{
	seed_1 = 2973871699,
	seed_2 = 1095320699,
	seed_3 = 3953323184
}

current_seed = choose(SEEDS.seed_1, SEEDS.seed_2, SEEDS.seed_3);

hp = 200;
max_hp = 5;
playerscore = 0;


