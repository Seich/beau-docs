# Request

Request is used to trigger a particular request. You do so by passing the
request's alias. It also has the option to remove formatting and displaying all
data available for a current request. By default it'll print the status code,
the endpoint and the body of the request's reponse.

## Usage

```bash
Executes a request by name.

USAGE
  $ beau request ALIAS

ARGUMENTS
  ALIAS  The alias of the request to execute.

OPTIONS
  -P, --param=param    [default: ] Allows you to inject values into the request's environment.
  -V, --verbose        Show all additional information available for a command.
  -c, --config=config  [default: beau.yml] The configuration file to be used.
  -i, --interactive    Choose request interactively.
  -j, --as-json        Outputs the response as json.
  --no-format          Disables color formatting for usage on external tools.
  --quiet              Skips the output.
```

```bash
$ beau request pokemon
```

## [Params](#params)

You can pass params using the `--param` flag. These parameters are added to your
external env variables. They will replace any variables added using `.env`. They
follow the same format as `.env` for each variable.

```bash
$ beau request pokemon --param="pokemon=dragapult"
```

You'd be able to use the param within your Beau file like this:

```yaml
---
GET /pokemon/$env._.pokemon: pokemon
```
