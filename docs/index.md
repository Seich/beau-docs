# Getting Started
In just a couple of steps you can have Beau up and running on your local machine.

## Writing a config file
The first thing you should do is create a config file. By default this should be named `beau.yml`. You start by specifying an endpoint:

**beau.yml**

```yaml
Endpoint: http://example.com
```

Now you can add any requests you want; a request follows the format `<METHOD> <PATH>: <ALIAS>`. Like this:

**beau.yml**

```yaml
Endpoint: http://example.com

GET /version: get-version
```

The alias is used to tell Beau what request you want to make.

## Using Beau
Now that’d you’ve written your request file you can tell Beau you want to make a request like this:

```
npx beau request get-version
```

Beau will let you know once it’s done executing and will print the response:

```
Status              Endpoint
200                 http://example.com/version

{
	version: “0.9”
}
```

And that’s it! If you’d like to install beau you can run:

```
npm install -g beau
```

That way you can call it without using `npx` in the future like:

```
Beau request get-version
```

That’s pretty much it. You are well on your way to mastering Beau. Take a look at the [requests](/docs/requests) section to learn more on what a request can do.
