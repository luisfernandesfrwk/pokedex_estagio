class PokeApi {
    PokeApi({this.pokemon});
    _baseUrl = "https://pokeapi.co/api/v2/pokemon?limit=1118&offset=0";
    _pokemonBaseUrl = "https://pokeapi.co/api/v2/${this.pokemon}";

}
