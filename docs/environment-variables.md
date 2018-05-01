# Environment Variables

Environment variables allows you to set variables arbitrarily. These variables
are added to the internal cache just as the response of any other request is.
This means they can be used anywhere normal requests can be composed on. These
are added under the `env` key, which means you can compose them using $env
anywhere you want to.

## Key

You can define them using the `environment` key. All values under this key will
be available under the `$env` variable for your use.

You will normally want to use it as an object:

```yaml
...

environment:
  the:
    post: 15

GET /posts/$env.the.post: get-post
```

But you can also use it as an array:

```yaml
...

environment:
  - 15

GET /posts/$env.0: get-post
```

or even as a single value if you are feeling lazy:

```yaml
...

environment: 15

GET /posts/$env: get-post
```
