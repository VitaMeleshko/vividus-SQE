Scenario: Verify that allows creating a User
Given I initialize story variable `userName` with value `#{generate(Name.fullName)}`
Given I initialize story variable `password` with value `#{generate(Internet.password)}`
When I set request headers:
|name            |value           |
|Content-Type    |application/json|
Given request body:
{
  "id": 0,
  "username": "${userName}",
  "firstName": "string",
  "lastName": "string",
  "email": "string",
  "password": "${password}",
  "phone": "string",
  "userStatus": 0
}
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/user`
Then response code is equal to `200`


Scenario: Verify that allows login as a User
When I set request headers:
|name    |value      |
|username|${userName}|
|password|${password}|
When I execute HTTP GET request for resource with URL `https://petstore.swagger.io/v2/user/login`
Then response code is equal to `200`


Scenario: Verify that allows log out User
When I execute HTTP GET request for resource with URL `https://petstore.swagger.io/v2/user/logout`
Then response code is equal to `200`
Then content type of response body contains `ok`
