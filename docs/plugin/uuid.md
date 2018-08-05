# UUID

The UUID plugin allows you to generate UUID v4.

## Dynamic Values

### uuid()

`uuid` returns a randomly generated uuid v4.

#### Example:

```yaml
POST /post:
    alias: create-post
    payload:
        id: $[uuid()]
```
