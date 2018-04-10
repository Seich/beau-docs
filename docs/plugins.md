# Plugins

Beau supports two types of plugins: Modifiers and Dynamic Values. Modifiers
allow you to modify request settings before they are made and responses before
they are stored to the internal cache or displayed to the command line.

To use a plugin you have to specify it as part of your `beau.yml` configuration
file. You list these under the `plugins` key. You should pass the plugin name in
CamelCase. If you pass an object it's value will be passed onto the plugin;
These can be used to configure how the plugin behaves.

```yaml
endpoint: http://example.com
plugins:
    - MyPlugin
    - AnotherPlugin:
        settings:
            setting: 1
            setting2: true
...
```

## Modifiers

There are two types of Modifiers, request and response modifiers. These, are
their name reveals allow you to either modify the request being made or the
response received.

If a plugin registers a modifier it'll be passed the request after it's composed
variables have been replaced and the original request including any keys that
weren't used while making the request. This means you can pass additional
options to plugins as part of the request. This can be handy as a way to prevent
modifier execution or make changes in configuration for a particular request.

## Dynamic Values

Dynamic values allow you to call special functions from within your Beau
configuration file. To call them you use a dollar sign followed by square
brackets. Within these brackets you can specify what function you'd like to
call. For example:

```yaml
endpoint: http://example.com

GET /user:
    alias: get-user
    headers:
        authorization: $[jwt('this is a secret')]
```

Notice that within the square brackets the function is invoked exactly as a
javascript function allowing you to pass over arguments along with the function
call.

## Making your own

Plugins in Beau are very straightforward to create all you need is to define a
javascript class:

```javascript
class Date {
    constructor(registry, settings = {}) {}
}
```

A new instance of this class will be created whenever Beau is invoked. It'll
receive a reference to the Beau Plugin Registry and any settings that were
specified as part of the beau configuration. After that you can use the registry
to register any modifiers or dynamic values you want to have added.

The plugin registry has a couple of methods to define these:

* `registry.addPreRequestModifier(fn)`

* `registry.addPostRequestModifier(fn)`

* `registry.defineDynamicValue(name, fn)`

They all take a function that'll be called whenever the plugin is used within
Beau. When defining a dynamic value you also have to specify it's name.

Here's a full example:

```javascript
class Date {
    constructor(registry, settings = {}) {
        registry.addPreRequestModifier(this.preRequest);
        registry.addPostRequestModifier(this.preRequest);
        registry.defineDynamicValue('date', this.date);
    }

    preRequest(request, orig) {
        request.headers.startDate = new Date();
        return request;
    }

    postRequest(response, orig) {
        response.headers.endDate = new Date();
        return response;
    }

    date() {
        return new Date().toString();
    }
}

module.exports = Modifiers;
```

Here we are making it so every request and response has a header added with the
current date. It also adds a `date` dynamic value that when called will print
the current date. You can define as many modifiers and dynamic values as you
want from a single class.

Notice that the modifiers receive the request/response they are meant to edit
and the original request as defined in the Beau configuration file. This allows
you to access values that Beau didn't use as part of the request. You can use
these arbitrary values to add additional options to your plugin.
