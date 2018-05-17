# List

List shows you the list of currently configured requests, it's methods and
aliases.

## Usage

```
Lists all available requests in the config file.

USAGE
  $ beau list

OPTIONS
  -V, --verbose        Show all additional information available for a command.
  -c, --config=config  [default: beau.yml] The configuration file to be used.
  --no-format          Disables color formatting for usage on external tools.
```

### Example

```
$ beau list
```

The out will generally look like this:

```
  HTTP Verb      Alias           Endpoint
  GET            get-post        http://jsonplaceholder.typicode.com/posts/1
  GET            posts           http://jsonplaceholder.typicode.com/posts/
  POST           new-post        http://jsonplaceholder.typicode.com/posts/
  GET            post-user       http://jsonplaceholder.typicode.com/users/$posts.body.0.userId
```
