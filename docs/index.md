# Getting Started

Beau is super fast to get started with. Just follow these steps to be up and
running in a couple of minutes.

## Installing Beau

You can install beau using your favorite node package manager.

```
$ npm install -g beau
```

Done!

## Writing a config file

The first thing you have to do is create a new config file. The default name for
this file is `beau.yml` but you can name it whatever you want. Normally you'll
want to start it off by specifying the endpoint you'll be hitting.

**beau.yml:**

```yaml
endpoint: http://example.com
```

You can now add your first request, if you wanted to GET
http://example.com/posts you'd tell Beau so by adding a new
[request](/docs/requests) and it's alias:

**beau.yml**

```yaml
endpoint: http://example.com

GET /posts: posts
```

Now you are ready to make your first request.

## Using the CLI

The Beau CLI is fairly simple, you can list all requests in your config file
using:

```
$ beau list
```

It should output something like this:

```
HTTP Verb     Alias       Endpoint
GET           posts       http://example.com/posts/
```

There's our `posts` request. We'll tell beau to request that one using:

```
$ beau request posts
```

When done it'll print the results to the command line like this:

```
Status              Endpoint
200                 http://example.com/posts/

[
  {
    userId: 1,
    id: 1,
    title: "sunt aut facere repellat",
    body: "quia et suscipit suscipit recusandae consequuntur"
  },
  ...
]
```

And that's it! You are well on your way to mastering Beau. Take a look at the
[requests](/docs/requests) section to learn more on what a request can do.
