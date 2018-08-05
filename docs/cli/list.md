# List

List shows you the list of currently configured requests, it's methods and
aliases.

## Usage

```bash
Lists all available requests in the config file.

USAGE
  $ beau list

OPTIONS
  -V, --verbose        Show all additional information available for a command.
  -c, --config=config  [default: beau.yml] The configuration file to be used.
  --no-format          Disables color formatting for usage on external tools.
```

### Example

```bash
$ beau list
```

The out will generally look like this:

```bash
  HTTP Verb      Alias           Endpoint
  GET            get-post        http://example.com/posts/1
  GET            posts           http://example.com/posts/
  POST           new-post        http://example.com/posts/
  GET            post-user       http://example.com/users/$posts.body.0.userId
```
