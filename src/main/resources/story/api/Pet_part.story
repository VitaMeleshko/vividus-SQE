Scenario: Verify that allows adding a new Pet
Given I initialize STORY variable `petName` with value `#{generate(Dog.name)}`
Given I initialize STORY variable `petId` with value `#{generate(Twitter.userId)}`
When I set request headers:
|name            |value           |
|Content-Type    |application/json|
Given request body:
{
  "id": ${petId},
  "category": {
    "id": 0,
    "name": "${petName}"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet`
Then response code is equal to `200`


Scenario: Verify that allows updating Pet’s image
Given I initialize SCENARIO variable `petPhoto` with value `/data/dog.png`
When I create temporary file with name `dog.png` and content `${petPhoto}` and put path to SCENARIO variable `/data/dog.png`
Given multipart request:
|type|name     |value           |contentType        |fileName|
|file|file-key |/data/dog.png   |multipart/form-data|        |
|file|file-key2|${/data/dog.png}|image/png          |        |
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet/${petId}/uploadImage`
Then response code is equal to `200`


Scenario: Verify that allows updating Pet’s name and status
When I set request headers:
|name            |value           |
|Content-Type    |application/json|
Given request body:
{
  "id": ${petId},
  "category": {
    "id": 0,
    "name": "New"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "pending"
}
When I execute HTTP PUT request for resource with URL `https://petstore.swagger.io/v2/pet`
Then response code is equal to `200`


Scenario: Verify that allows deleting Pet
When I set request headers:
|name            |value           |
|Content-Type    |application/json|
When I execute HTTP DELETE request for resource with URL `https://petstore.swagger.io/v2/${petId}`
Then response code is equal to `404`
