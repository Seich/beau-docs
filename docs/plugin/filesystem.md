# FileSystem

The filesystem plugin provides dynamic values to access local files.

> Beau sets the CWD to be the same as the Beau config file; This allows you to
> make all paths relative when using plugins that access the filesytem.

## Dynamic Values

### createReadStream(path: string[, options])

`createReadStream` is just an alias for Node's
[createReadStream](https://nodejs.org/api/fs.html#fs_fs_createreadstream_path_options).
It takes the same options. The created stream can be used internally by Beau to
read files and upload them using the request's formData.

#### Example:

```yaml
POST /picture:
    alias: upload-picture
    formData:
        title: Kittens
        image: $[createReadStream('./kittens.jpg')]
```
