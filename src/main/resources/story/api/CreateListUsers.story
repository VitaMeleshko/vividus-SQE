Scenario: Verify that allows creating the list of Users
Given I initialize story variable `userId` with value `#{generate(Twitter.userId)}`
When I set request headers:
|name            |value           |
|Content-Type    |application/json|
Given request body: [
  {
    "id": ${userId},
    "username": "Test_User_1",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  },
  {
    "id": ${userId},
    "username": "Test_User_2",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }]
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/user/createWithList`
Then response code is equal to `200`
