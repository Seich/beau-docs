# Composition

Sometimes you want to use the data from a request on another request. For this
sort of situation Beau allows you to compose any number of requests together.
You can use any data from the request or the response on any other request.

You use the alias to compose two requests together. To tell Beau you are
referencing another request you can use a dollar sign ($) followed by a
request's alias like this: `$posts`.

Here's an example. Having this configuration file:

```yaml
version: 1
endpoint: 'http://jsonplaceholder.typicode.com'

POST /posts/:
  alias: new-post
```

In this configuration file we have a request called `new-post`. This request
creates a new post and returns it's id. It looks something like this:

```json
{
  id: 1
}
```

Nice. Let's say we want to request that post now that it's created. We can
create a new request like this:

```yaml
...
GET /posts/$new-post.response.body.id:
  alias: get-post
```

This look pretty typical except for the first line which looks kind of weird.
`$new-post.body.id` is our way of telling Beau that we want a particular request
to run before running this one. What it's saying is that we want to grab the
`id` from `$new-post`'s response's `body`. So basically we call that request and
then everything from the response is available and we can use it as a variable
everywhere else. Beau runs every request depended upon before finally calling a
request.

Since most of the time we are going to be using the requests response body you
can omit the `response` part making it slightly nicer to use.

These two are equivalent:

```yaml
...
GET /posts/$new-post.response.body.id:
  alias: get-post
```

```yaml
...
GET /posts/$new-post.body.id:
  alias: get-post
```

The second being a tad faster to write.

An important thing to notice is that you can compose into not only a path or
endpoint but also into the headers, params and payload. Making it pretty
flexible. Here's a couple more examples:

```yaml
...
GET /posts/:
  params:
    userId: $user-profile.body.userId
```

```yaml
...
GET /posts/:
  headers:
    authentication: Bearer $session.body.token
```

```yaml
GET /posts/:
  params:
    userId: $user-profile.body.userId
```

```yaml
GET /user/greeting:
  alias: get-greeting
  payload: >
   Hello $get-name.body,
   how are you?
```

If you ever want to see what values are available for a particular request you
can run it with the `--verbose` flag and Beau will show you all the data it has
available.

```
$ beau request new-post

  Status              Endpoint
  201                 http://jsonplaceholder.typicode.com/posts/

{
  request: {
    headers: {
      accept: "application/json",
      content-type: "application/json",
      content-length: 2
    },
    body: "{}",
    endpoint: "http://jsonplaceholder.typicode.com/posts/"
  },
  response: {
    status: 201,
    headers: {
      date: "Wed, 27 Dec 2017 04:56:01 GMT",
      content-type: "application/json; charset=utf-8",
      content-length: "15",
      connection: "close",
      access-control-allow-credentials: "true",
      cache-control: "no-cache",
      access-control-expose-headers: "Location",
      location: "http://jsonplaceholder.typicode.com/posts/101",
    },
    body: {
      id: 101
    }
  },
  body: {
    id: 101
  }
}
```
