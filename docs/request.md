# Request

Request is used to trigger a particular request. You do so by passing the
request's alias. It also has the option to remove formatting and displaying all
data available for a current request. By default it'll print the status code,
the endpoint and the body of the request's reponse.

## Usage

```
$ beau request --help

  Usage: request [options] <alias>


  Options:

    -c --config <config>  Specify your request config file. Defaults to beau.yml in the current directory. (default: beau.yml)
    -v --verbose          Show all the information available on the current request.
    --no-format           Return the text without any special formatting. (default: true)
    -h, --help            output usage information
```

### Example

```
$ beau request example-request
```
