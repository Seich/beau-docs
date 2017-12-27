# Dynamic Values

```yaml
version: 1
endpoint: 'http://jsonplaceholder.typicode.com'

defaults:
	headers:
		authentication: bearer [token(secret", 22, {userid: 25})]
	params:
		hello: world

GET /posts/1: get-post
GET /posts/: posts
```
