# DotEnv

Beau supports [DotEnv](https://github.com/motdotla/dotenv) out of the box. Any
variables defined in your .env file will be available as a environmental
variable within your beau.yml file.

## Example

Given this `.env` file:

```
POST=1
```

You'd have `POST` available under `$env._` in your beau file. You can use it
like this:

```yaml
...
GET /post/$env._.POST: get-post
```

Keep in mind that variables defined in your `.env` will override variables
defined in your beau.yml file. So given this `beau.yml` file:

```yaml
...
environment:
	_:
		post: 1

GET /post/$env._.post: get-post
```

and this `.env` file:

```
post=2
```

`$env._.post` will resolve to "2". You can use this to have defaults in place
which can be replaced locally as needed.

Remember to keep your .env file out of your repo to prevent weird, hard-to-debug
bugs.

> These external environment variables are also shared with the `param` flag
> when requesting something. They also have a lower priority so you can use the
> `param` flag to override these values. Checkout
> [Request](/docs/request.html#params) for more information.
