# Hosts

WIP

```yaml
version: 1
endpoint: 'http://jsonplaceholder.typicode.com'

GET /posts/1: get-post
GET /posts/: posts


host:
  endpoint: hi.com

  POST /posts/:
    alias: new-post

  GET /users/$posts.body.0.userId:
    alias: post-user
    params:
      hello: 'world'

```
