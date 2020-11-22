# Environment Variables

Environment variables allows you to set variables arbitrarily. These variables
are added to the internal cache just as the response of any other request is.
This means they can be used anywhere normal requests can be composed on. These
are added under the `env` key, which means you can compose them using `$env`
anywhere you want to.

## Key

You can define them using the `environment` key. All values under this key will
be available under the `$env` variable for your use.

```yaml
...

environment:
  the:
    post: 15

GET /posts/$env.the.post: get-post
```

## DotEnv

Beau supports [DotEnv](https://github.com/motdotla/dotenv) out of the box. Any
variables defined in your .env file will be available as a environmental
variable within your beau.yml file.

### Example

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
> [Request](/docs/cli/request.html#params) for more information.
