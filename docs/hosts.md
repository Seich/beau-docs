# Hosts

Beau allows you to define multiple hosts if you need to call multiple different
endpoints. By default there's a "global" host implicitly defined on the first
document in the file.

You can define hosts by specifying multiple documents in the YAML file. In YAML
you can define multiple documents in a file by separating them with "---". If
more than one document is defined, Beau will take the first one as the "global"
one. Any additional ones will exist in a different namespace. The namespace for
these additional documents is defined under the `host` key. This key will be
used when composing and requesting these requests so something brief and with a
clear meaning is advised.

```yaml
endpoint: http://posts.example.com
GET /:
	alias: posts
	headers:
		Authentication: Bearer $session:create-session.body.token

---
host: session
endpoint: http://sessions.example.com

POST /:
	alias: create-session
	payload:
		username: user
		password: pass
```

In this example we have to documents defined in the `beau.yml` file. The first
one is the global host and the second one is namespaced under _session_. You can
compose these additional requests from any other host, such as the global host
by prepending the host name, _session_, and a colon to the request name.

To call a request under a host you also have to prefix it's host name followed
by a colon:

```
$ beau request session:create-session
```

### Defaults

Defaults within a host behave slightly different as they do on the global host.
Default keys within a host are first merged with the defaults from the global
host before being merged with the values withing a given request. Most values
will be ignored if passed `false` as a value so you can use this to remove keys
coming from the global defaults.

## Examples

You can compose between all requests defined on the different hosts including
the global one.

```yaml
endpoint: http://posts.example.com

GET /posts:
	alias: posts
	header:
		authentication: Bearer $session:create-session.body.token

---
host: session
	endpoint: http://session.example.com

	POST /session:
		alias: create-session
		payload:
			username: user
			password: pass

---
host: profile
	endpoint: http://profile.example.com

	GET /user/1:
		alias: get-profile
		header:
			authentication: Bearer $session:create-session.body.token
```

All hosts inherit defaults from the global host meaning you could rewrite this
as:

```yaml
endpoint: http://posts.example.com

defaults:
	headers:
		authentication: Bearer $session:create-session.body.token

GET /posts: posts

---
host: session
endpoint: http://session.example.com

POST /session:
	alias: create-session
	payload:
		username: user
		password: pass

	headers: false

---
host: profile
endpoint: http://profile.example.com

GET /user/1: get-profile
```

You can also define defaults on a per host basis:

```yaml
...
host: profile
endpoint: http://profile.example.com

defaults:
	headers:
	authentication: Bearer $session:create-session.body.token

GET /user/1: get-profile
```

Every set of defaults will be merged with the global defaults first. So you can
mix and match as needed.
