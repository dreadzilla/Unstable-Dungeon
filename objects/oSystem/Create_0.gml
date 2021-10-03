/// @description Initialize world
randomize();

enum SEEDS
{
	seed_1 = 2973871699,
	seed_2 = 1095320699,
	seed_3 = 3953323184
}

current_seed = choose(SEEDS.seed_1, SEEDS.seed_2, SEEDS.seed_3);

max_hp = 20;
hp = max_hp;
playerscore = 0;
haskey = 0;

start_timer=true;

display_map=false;