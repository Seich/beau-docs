# Defaults

Defaults allow you to set default values for every request in a Beau file. They
are merged with any request specific configuration. The request's configuration
take priority and will override any defaults if there's a collision.

## Key

To use them you have to specify a `defaults` key.

## Options

You should pass an object to specify any default values. These can be anything
and they'll be added and/or merged to every request's config.

For example, if every request required a specific parameter you could set it as
a default:

```yaml
endpoint: http://example.com
defaults:
	params:
		userId: 5

GET /profile: profile
POST /profile:
	alias: save-profile
	params:
		userId: 112
```

In this case `profile` will also have the param `userId` set to 5 as per the
defaults. `save-profile` on the other hand has overriden that param so when
`save-profile` is requested `userId` will be set to 112. Unless overriden
defaults will be added to every request.

You can also use composition on the defaults. For example:

```yaml
endpoint: http://example.com
defaults:
	headers:
		authentication: Bearer $session.body.token

POST /session:
	alias: session
	headers: null

GET /profile: profile
```

In this case we are telling Beau to add an authentication token to every
request. We are also telling it to get that token from the $session request. If
we requested profile, it'll have the appropiate token added. It's worth noting
that we have overriden the headers in the session request otherwise the session
request would depend on itself and we would hit an infinite loop.
