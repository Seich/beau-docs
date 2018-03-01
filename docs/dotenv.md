# DotEnv

Beau supports [DotEnv](https://github.com/motdotla/dotenv) out of the box. Any
variables defined in your .env file will be available as a environmental
variable within your beau.yml file.

## Example

Given this `.env` file:

```
POST=1
```

You'd have `POST` available under `$env` in your beau file. You can use it like
this:

```yaml
...
GET /post/$env.POST: get-post
```

Keep in mind that variables defined in your `.env` will override variables
defined in your beau.yml file. So given this `beau.yml` file:

```yaml
...
environment:
	post: 1

GET /post/$env.post: get-post
```

and this `.env` file:

```
post=2
```

`$env.post` will resolve to "2". You can use this to have defaults in place
which can be replaced locally as needed.

Remember to keep your .env file out of your repo to prevent weird, hard-to-debug
bugs.
