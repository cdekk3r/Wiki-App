<h3>Blocipedia</h3>

Blocipedia is a Ruby on Rails application that allows users to create wikis and collaborate on other wikis. Users can pay to upgrade their membership, allowing them to view and create private wikis.

The source code is here on GitHub: https://github.com/cdekk3r/new-rails-project

This app was created as part of the Bloc Full Stack Web Development course.

<h3>Features</h3>

- Users can create a standard account in order to create, edit, and collaborate on public wikis using Markdown syntax. Anyone can view public wikis.
- Users can pay to upgrade their account to Premium in order to view and create private wikis.
- Premium users can allow others to view and collaborate on the private wikis they create.
- Premium users can downgrade their account back to Standard.
- When a user downgrades his or her account, his or her private wikis will automatically become public.

<h3>Deployment</h3>

Environment variables were set using Figaro and are stored in config/application.yml (ignored by git).

The config/application.example.yml file illustrates how environment variables should be stored.

To run Blocipedia locally:

- Clone the repository
- Run bundle install
- Create and migrate the SQLite database with rake db:create and rake db:migrate
- Start the server using rails server
- Run the app on localhost:3000

<h3>Languages and Frameworks</h3>

Languages and Frameworks: Ruby on Rails and Bootstrap
Ruby version 2.3.4

<h3>Development Tools and Gems include:</h3>

- Devise for user authentication
- Redcarpet for Markdown formatting
- Pundit for authorization
- Stripe for payments

<h3>Explanation</h3>

This Wiki Application is my second project built with Ruby on Rails. Minimal instructions were provided by Bloc leaving more decision making and implementaion up to me.

<h3>Problem</h3>
For this application I needed to create three roles: standard, premium, and admin. The main function of roles is to control what the user can see.

<h3>Solution</h3>
The Pundit gem will be used to implement authorization. Add `gem "pundit"` to the Gemfile and `include Pundit` in the application controller. This gives the ability to create a policy for Wikis. In `wiki_policy.rb`
I defined a class called a policy scope. This will control what the user is able to see. Inside the method we can now create conditions based on the user role.

```
def resolve
    wikis = []
    if user.role == "admin"
        wikis = scope.all
    end
end
```

An empty array is created to fill with visible wikis. The admin role is able to see everything so I simply assign the whole scope to the wikis array. The same idea is use for other roles with slight variation.
Since a standard user is only able to see public wikis I need to loop through `scope.all` and add only wikis that are NOT private to the array.

```
wikis_all = scope.all
wikis_all. each do |wiki|
    if !wiki.private
        wikis < wiki
    end
end
```


<h3>Problem</h3>

<h3>Solution</h3>


