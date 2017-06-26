Codika Fibonacci API
==============================================

Environment
----------------------------------------------

- Ruby version: `2.4.0`
- Rails version: `5.1.0`
- Ruby version manager: `rvm`

Configuration
----------------------------------------------

- `bundle install`
- `rails db:setup`

Usage
----------------------------------------------

Example with cURL:

1. `bundle exec rails server`

2. Get session tokens
```
curl -X POST \
  http://localhost:3000/api/v1/auth/sign_in \
  -H 'cache-control: no-cache' \
  -H 'email: partnership@example.com' \
  -H 'password: partnership' \
```

3. Copy Access-Token, Client and Uid

4. Get fibonacci serie with tokens
```
curl -X GET \
  'http://localhost:3000/api/v1/fibonaccis?n=<n>' \
  -H 'access_token: <access_token>' \
  -H 'cache-control: no-cache' \
  -H 'client: <client>' \
  -H 'uid: <uid>'
```
Lamontanaro Francisco Javier, lamontanarofrancisco@gmail.com
