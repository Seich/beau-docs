# Getting Started

## Installation

You can install Beau using npm:

```bash
$ npm install -g beau
```

## Writing a config file

The first thing you should do is create a config file. By default this should be
named `beau.yml`. You can start by specifying an endpoint:

> We'll be using [pokeapi](https://pokeapi.co) as our example endpoint.

**beau.yml**

```yaml
endpoint: https://pokeapi.co/api/v2
```

Now you can add any requests you want; a request follows the format
`<METHOD> <PATH>: <ALIAS>`. For example, let's fetch Blaziken, pokemon number
257:

**beau.yml**

```yaml
endpoint: https://pokeapi.co/api/v2

GET /pokemon/257:
	alias: blaziken
```

_blaziken_ is our alias, it will be used to tell Beau what request you want to
make.

## Using Beau

Now that’d you’ve written your request file you can tell Beau you want to make a
request like this:

```bash
$ beau request blaziken
```

Beau will let you know once it’s done executing and will print the response:

```json
Status              Endpoint
200                 http://example.com/version

{
	forms: […],
	abilities: […],
	stats: […],
	name: "blaziken",
	weight: 520,
	moves: […],
	sprites: {…},
	held_items: [],
	location_area_encounters: "/api/v2/pokemon/257/encounters",
	height: 19,
	is_default: true,
	species: {…},
	id: 257,
	order: 329,
	game_indices: […],
	base_experience: 239,
	types: […]
}
```

And that’s it! You are well on your way to mastering Beau. Take a look at the
[requests](/docs/requests) section to learn more on what a request can do.
