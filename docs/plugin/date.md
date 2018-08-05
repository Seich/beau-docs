# Date

The Date plugin includes dynamic values to format dates.

## Settings

```
- std:
    date:
        format: YYYY-MM-DDTHH:mm:ss.SSSZ
```

### Format

Format is the default format that will be used when using date functions. All
functions accept an optional format. If no format is provided to them they'll
fallback to this one.

## Dynamic Values

### now(format: string)

`now` returns the current date and time in the given format.

#### Example:

```yaml
POST /post:
    alias: create-post
    payload:
        creation-date: $[now()]
```

### date(year: int, month: int, day: int, format: string)

`date` returns the given date with the given format.

#### Example:

```yaml
PUT /post:
    alias: update-post
    payload:
        updated-date: $[date(2018, 2, 25)]
```
