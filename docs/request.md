# Request

Request is used to trigger a particular request. You do so by passing the
request's alias. It also has the option to remove formatting and displaying all
data available for a current request. By default it'll print the status code,
the endpoint and the body of the request's reponse.

## Usage

```
Executes a request by name.

USAGE
  $ beau request ALIAS

ARGUMENTS
  ALIAS  The alias of the request to execute.

OPTIONS
  -P, --param=param    Allows you to inject values into the request's environment.
  -V, --verbose        Show all additional information available for a command.
  -c, --config=config  [default: beau.yml] The configuration file to be used.
  --no-format          Disables color formatting for usage on external tools.
```

```
$ beau request example-request
```

## [Params](#params)

You can pass params using the `--param` flag. These parameters are added to your
external env variables. They will replace any variables added using `.env`. They
follow the same format as `.env` for each variable.

```
$ beau request example-request --param="hello=world"
```

You'd be able to use the param within your Beau file like this:

```yaml
...
GET /hello/$env._.hello: helloWorld
...
```
