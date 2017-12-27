# Init

Init allows you to create a beau.yml file right from the command line. You can pass the endpoint you want so it's setup at creation. It's just a quick shortcut. If no endpoint is provided the file will only have it's version set.

## Usage

```
$ beau init --help

  Usage: init [options]


  Options:

    -e --endpoint <endpoint>  Allows you to set the default endpoint (default: null)
    -h, --help                output usage information
```

### Example
```
$ beau init --endpoint="http://example.com"
```
