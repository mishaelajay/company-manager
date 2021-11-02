Hi Slava,

Thank you for the task description and my apologies for the delay.
This repository contains my basic implementation for the requirements you have given.
The ui is very basic and just enough to interact with the application.

I have deployed this repository on heroku - [Company Manager](https://shielded-retreat-15233.herokuapp.com/)

After going through the task description i explored various ways of doing this in the most efficient way.

So when storing hierarchial data we have to make a bargain between fast read times and fast write times. 
I went with the assumption that companies don't get created that very often and decided to use nested set which gives us fast read times but the 
write times is slower when compared to a no-sql implementation or an adjaceny list for that matter.

Below is a representation of how companies look visually when stored in a database that uses nested set.

![comapny_nested_set](https://user-images.githubusercontent.com/13768552/139866361-72397ab7-6ae8-4391-923a-e2ed64eb1ab1.jpeg)
![company_tree_representation](https://user-images.githubusercontent.com/13768552/139866363-772c2520-227d-45b4-a598-88892326af0f.jpeg)

Dependencies:

- I have made use of [awesome_nested_set](https://github.com/collectiveidea/awesome_nested_set) gem.
- I have implemented the solution in Rails 6.1.4 and thereby using many of the benefits that come along with Rails.

Testing:
- I have added the tools that i usually use for testing. If you have a look at my [Gemfile](https://github.com/mishaelajay/company-manager/blob/main/Gemfile) you will see the description of what each one does.
- I have added minimal test cases for the models - Employee.rb and Company.rb.

Linting:
- I have used rubocop along with a few extensions for linting.
- I have also setup pre-commit and pre-push hooks in the scripts folder.
- rubocop runs before commit and brakeman along with test cases run before a push.


Setting it up on your local:

- Clone the repository.
- Install ruby 3.0.2. Or set RVM to use 3.0.2
- Install postgres and create company_manager_development database
- ```bundle install```
- ```rails db:migrate```
- Start the server using ```rails s```

To run the test cases:

```rails test:all```

What i have missed:
- Adding a bottleneck identifier and a error logging service.
- Validations to prevent invalid data getting stored in the models.
- Comments explaining what each function does.
- Too much caching to improve read times which involves overhead.
  - I have a counter cache for employees_count for each company
  - I have a counter cache for sub_company_count for each company
  - I am also maintaining the total_employees_count on destroy or on create 


I have covered all the requirements as shown below.
- [x] Add a company (each company has a unique ID)
- [x] Set relations between companies
- [x] Set required amount of employees for the company
- [x] Remove a company
- [x] Add an employee to the company (each employee has a unique ID, other attributes are irrelevant)
- [x] Remove an employee from the company
- [x] Get a list of all companies
- [x] Get a list of all companies where the amount of employees is less than required

Ruby and rails version: 
Ruby 3.0.2
Rails 6.1.4
