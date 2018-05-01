# List

List shows you the list of currently configured requests, it's methods and
aliases.

## Usage

```
$ beau list --help

  Usage: request [options] <alias>


  Options:

    -c --config <config>  Specify your request config file. Defaults to beau.yml in the current directory. (default: beau.yml)
    -v --verbose          Show all the information available on the current request.
    --no-format           Return the text without any special formatting. (default: true)
    -h, --help            output usage information
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
