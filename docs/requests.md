# Requests

Requests are the basic building block in Beau. These define a particular HTTP
request, it's properties, dependencies and content. They can be composed
together to make more complex requests that might depend on another's value to
complete.

Any key formatted as `METHOD /path` is considered a request by Beau. If they
have an alias they are requestable by the Beau CLI and by other requests. They
can be composed with other requests and configured to send along a given
payload, parameters and headers when requested.

Here's an example:

```yaml
POST /post/:
  alias: post
  params:
  	id: 25
  headers:
  	authentication: "Bearer token"
  payload:
  	name: David
  	lastname: Diaz
```

## Key

The key has to be formatted as `<method> <path>`, where the **method** is any
valid HTTP method (GET, HEAD, POST, PUT, DELETE, CONNECT, OPTIONS, TRACE, PATCH)
followed by a path. The path will be appended to the current
[endpoint](settings.html#endpoint) when being requested.

These are all valid keys:

```yaml
...
POST /path: ...
GET /path: ...
PATCH /path: ...
PUT /path: ...
```

## Options

If you pass a string as the value instead of an object, that string will be used
as an alias.

### Alias

The alias is what you will use to call the request from the CLI and what you'll
use to compose requests together. It ideally is something short and easy to
type. It allows special characters but if you expect to compose a given request
you should avoid using dots.

```yaml
...
	alias: name
```

### Headers

The headers settings allow you to set any headers you want to send along with
the HTTP request. You can pass an unlimited number of key-value pairs.

```yaml
...
	headers:
		authentication: "Bearer token"
		some-other: header
```

### Params

The params settings allow you to define any parameters you'd like to send as
part of your request. These parameters are added to the query string of the
request.

```yaml
...
	params:
		id: 25
		order: ASC
```

### Payload

The payload is where you set the request's body. It will be converted to json
automatically if given an object, otherwise you can send text. You shouldn't use
this with `Form` or `FormData` as they'll override each other.

```yaml
...
	payload:
		id: 25
		order: ASC
```

```yaml
...
	payload: "Hello World!"
```

### Form

The form key automatically changes the request so that its content is a
URL-Encoded form. All key-values are encoded and sent as the payload. The
Content-Type header is set to `application/x-www-form-urlencoded` accordingly.
You shouldn't use this with `Payload` or `FormData` as they'll override each
other.

```yaml
...
	form:
		name: David
		lastname: Diaz
```

### FormData

The FormData key automatically changes the request so that its content is a
`multipart/form-data` form. It's Content-Type header is set accordingly. This is
mainly used if you want to upload file and submit other binary data. You
shouldn't use this with `Payload` or `Form` as they'll override each other.

```yaml
...
	formdata:
		name: David
		lastname: Diaz
```
