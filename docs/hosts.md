# Hosts

Beau allows you to define multiple hosts if you need to call multiple different
endpoints. By default there's a "global" host implicitly defined on the top most
level of the document. If you need to have others you can define them under the
`hosts` key.

## Key

You can define as many hosts as needed under the `hosts` key. It takes an array
of hosts as an input. A host definition look like:

```yaml
hosts:
  - host: hostname
    endpoint: http://example.com

    defaults:
    	headers:
    		authentication: Bearer 1234

    GET /posts: get-posts
```

The only required key is the `host`. It's used to `namespace` all requests
within the given host. You can use any keys you'd normally use within the host.

### Defaults

Defaults within a host behave slightly different as they do on the global host.
Default keys within a host are first merged with the defaults from the global
host before being merged with the values withing a given request. Most values
will be ignored if passed `false` as a value so you can use this to remove keys
coming from the global defaults.

## Examples

```yaml
version: 1

hosts:
	- host: example
	  endpoint: http://example.net

	  GET /posts: posts
```

To call a request under a host you have to prefix it's host name followed by a
colon:

```
$ beau request example:posts
```

You can compose these requests with the ones on other hosts and with the ones on
the global scope:

```yaml
version: 1
endpoint: http://posts.example.com

GET /posts:
	alias: posts
	header:
		authentication: Bearer $session:create-session.body.token

hosts:
	- host: session
	  endpoint: http://session.example.com

	  POST /session:
	  	alias: create-session
	  	payload:
	  		username: user
	  		password: pass

	 - host: profile
	   endpoint: http://profile.example.com

	   GET /user/1:
	     alias: get-profile
	     header:
	     	authentication: Bearer $session:create-session.body.token
```

All hosts inherit defaults from the global host meaning you could rewrite this
as:

```yaml
version: 1
endpoint: http://posts.example.com

defaults:
	headers:
		authentication: Bearer $session:create-session.body.token

GET /posts: posts

hosts:
	- host: session
	  endpoint: http://session.example.com

	  POST /session:
	  	alias: create-session
	  	payload:
	  		username: user
	  		password: pass

	  	headers: false

	 - host: profile
	   endpoint: http://profile.example.com

	   GET /user/1: get-profile
```

You can also define defaults on a per host basis:

```yaml
...
hosts:
	 - host: profile
	   endpoint: http://profile.example.com

	   defaults:
	     headers:
		 authentication: Bearer $session:create-session.body.token

	   GET /user/1: get-profile
```

Every set of defaults will be merged with the global defaults first. So you can
mix and match as needed.
