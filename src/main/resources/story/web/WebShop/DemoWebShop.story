Scenario: Verify that allows register a User
Given I am on main application page
When I click on element located by `By.xpath(//*[@class='header']//a[contains(text(), 'Register')])`
Given I am on page with URL `https://demowebshop.tricentis.com/register`


Scenario: Verify that allows login as a User
Given I am on main application page
When I click on element located by `By.xpath(//*[@class='header']//a[contains(text(), 'Log in')])`
Given I am on page with URL `https://demowebshop.tricentis.com/login`


Scenario: Verify that ‘Computers’ group has 3 sub-groups with correct names
Given I am on main application page
When I click on element located by `By.xpath(//*[@class='list']//a[contains(text(), 'Computers')])`
When I click on element located by `By.xpath(//a[contains(text(), 'Computers')]/following-sibling::ul/li/a[contains(text(), 'Desktops')])`
When I click on element located by `By.xpath(//a[contains(text(), 'Computers')]/following-sibling::ul/li/a[contains(text(), 'Notebooks')])`
When I click on element located by `By.xpath(//a[contains(text(), 'Computers')]/following-sibling::ul/li/a[contains(text(), 'Accessories')])`


Scenario: Verify that allows sorting items (different options)
Given I am on main application page
When I click on element located by `By.xpath(//*[@class='list']//a[contains(text(), 'Computers')])`
Given I am on page with URL `https://demowebshop.tricentis.com/desktops`
When I click on element located by `By.xpath(//select[@id='products-orderby'])`
When I click on element located by `By.xpath(//select[@id='products-orderby']/option[contains(text(), 'Name: A to Z')])`
When I click on element located by `By.xpath(//select[@id='products-orderby']/option[contains(text(), 'Name: Z to A')])`
When I click on element located by `By.xpath(//select[@id='products-orderby']/option[contains(text(), 'Price: Low to High')])`
When I click on element located by `By.xpath(//select[@id='products-orderby']/option[contains(text(), 'Price: High to Low')])`
When I click on element located by `By.xpath(//select[@id='products-orderby']/option[contains(text(), 'Created on')])`


Scenario: Verify that allows adding an item to the Wishlist
Given I am on main application page
When I click on element located by `By.xpath(//*[@class='list']//a[contains(text(), 'Jewelry')])`
When I click on element located by `By.xpath(//a[contains(text(), 'Black & White Diamond Heart')])`
Given I am on page with URL `https://demowebshop.tricentis.com/black-white-diamond-heart`
When I click on element located by `By.xpath(//input[@value= 'Add to wishlist'])`


Scenario: Verify that allows removing an item from the card
Given I am on main application page
When I click on element located by `By.xpath(//*[@class='list']//a[contains(text(), 'Books')])`
When I click on element located by `By.xpath((//input[@value= 'Add to cart'])[1])`
When I click on element located by `By.xpath(//span[contains(text(), 'Shopping cart')])`
When I CHECK checkbox located by `By.xpath(//input[@name='removefromcart'])`
When I click on element located by `By.xpath(//input[@name='updatecart'])`
Then text `Your Shopping Cart is empty!` exists


Scenario: Verify that allows removing an item from the card
Given I am on main application page
When I click on element located by `By.xpath(//*[@class='list']//a[contains(text(), 'Apparel & Shoes')])`
When I click on element located by `By.xpath((//input[@value= 'Add to cart'])[1])`
When I click on element located by `By.xpath((//input[@value= 'Add to cart'])[1])`
When I click on element located by `By.xpath(//span[contains(text(), 'Shopping cart')])`
When I CHECK checkbox located by `By.xpath(//input[@id='termsofservice'])`
When I click on element located by `By.xpath(//button[contains(text(), 'Checkout')])`


Scenario: Verify that allows adding an item to the card
Given I am on main application page
When I click on element located by `By.xpath(//*[@class='list']//a[contains(text(), 'Jewelry')])`
When I click on element located by `By.xpath(//a[contains(text(), 'Black & White Diamond Heart')])`
Given I am on page with URL `https://demowebshop.tricentis.com/black-white-diamond-heart`
When I click on element located by `By.xpath(//div[@class='product-essential']//input[@value= 'Add to cart'])`
