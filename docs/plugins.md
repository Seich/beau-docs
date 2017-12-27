# Plugins

Beau allows you to use plugins to modify requests before they are made and responses before they are shown. You can use this functionality for all sorts of creative things, like automatically generating authentication headers or formatting responses in special ways.

You can use a plugin by adding a `plugins` key to your configuration file like this:

```yaml
endpoint: http://example.com
    plugins:
        - MyPlugin:
            data:
                userId: 25
            secret: ssh

GET /profile:
    alias: profile
```

MyPlugin is the name of the plugin you want to use, any values you pass to it will be sent over to the plugin for initialization.


## Making Your Own
Beau plugins are just Javascript classes. They are fairly simple. They follow this convention:

```javascript
class MyPlugin {
    constructor(settings = {}) {
        this.settings = settings;
    }

    preRequest(req, orig) {}

    postResponse(res) {}
}

module.exports = MyPlugin;
```
The plugin will be initialized and passed any options as set in the Beau configuration file.

preRequest and postRequest are modifiers. They modify a request or a response. You can define one or both in a plugin. They'll be passed a request or reponse at a time and they can modify them as they see fit. They are passed a reference so you shouldn't return anything.
