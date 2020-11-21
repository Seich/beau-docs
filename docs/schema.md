# JSON Schema & Autocompletion

A JSONSchema is provided at
[https://beaujs.com/schema.json](https://beaujs.com/schema.json). It can be
referenced to provide validation and autocompletion on editors with JSONSchema
support for yaml files.

The schema is also available on schemastore.org so if your editor automatically
sync with it, it should work for beau.yml files from the get got.

In editors using the yaml-language-server you can manually reference the schema
with a comment for files not named beau.yml:

```yaml
# yaml-language-server: $schema=https://beaujs.com/schema.json
```

<video playsinline="" muted="muted" autoplay="autoplay" preload="auto" loop="loop">
    <source src="/assets/schema.mp4" type="video/mp4">
</video>

The schema has been tested successfully in NeoVim and VS Code.
