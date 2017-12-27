# Getting Started

Beau is super fast to get started with. Just follow these steps to be up and running in a couple of minutes.

## Installing Beau
You can install beau using your favorite node package manager.

```
$ npm install -g beau
```

Done!

## Writing a config file
The first thing you have to do is create a new config file. The default name for this file is `beau.yml` but you can name it whatever you want. You can either create this file yourself or have beau create it for you:

```
$ beau init --endpoint="http://example.com"
```

This will create a new file with the current version and with the endpoint set to whatever you want.

beau.yml:
``` yaml
version: 1
endpoint: http://example.com
```

You can now add your first request, if you wanted to GET http://example.com/posts you'd tell Beau so by adding a new request and it's alias:

beau.yml
``` yaml
version: 1
endpoint: https://jsonplaceholder.typicode.com

GET /posts:
	alias: posts
```

Now you are ready to make your first request.

## Using the CLI
The Beau CLI is fairly simple, you can list all requests in your config file using:

```
$ beau list
```

It'll list them like this:

```
HTTP Verb     Alias       Endpoint
GET           posts       https://jsonplaceholder.typicode.com/posts/
```

There's our `posts` request. We'll tell beau to request that one using:

```
$ beau request posts
```

This should eventually give your whatever the server responded back:

```
Status              Endpoint
200                 https://jsonplaceholder.typicode.com/posts/

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
