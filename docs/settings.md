# Settings

These settings change how Beau behaves globally.

## Keys

### Endpoint

This endpoint will be used for all top level requests. It'll be combined with
every request's path before making the request. It mostly serves to prevent
having to type the full url for every request. It is optional though so if you
want to put the full url on every request you can.

This setting can be overriden in hosts.

```yaml
endpoint: http://example.com/api
```

### CookieJar

By setting `cookiejar` to `true` you allow Beau to store cookies in memory. When
using composition these cookies are available for future requests. This allows
things like cookie-based sessions to work correctly. You could use a plugin to
store cookies to disk instead if required. This is disabled by default.

```yaml
cookiejar: true
```

### Version

The version is used to know what version of Beau this configuration was built
for. For now it doesn't actually do anything as the schema will keep on changing
freely until version 1 is hit. After that the major version of Beau will change
if the schema changes.

You can omit this value if you'd like. If it is omitted Beau will asume that
this config will work with the current version of Beau.

```yaml
version: 1
```
