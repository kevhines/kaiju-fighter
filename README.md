# kaiju fighter - README

A Monster fighter. Create monsters, give them stats and let them fight. Monsters that fight get hurt (as do the cities they fight in) and everyone else heals or rebuilds. Winning monsters get hurt less than losing monsters. Battle Royales randomly has every monster fight. Check out the standings!

## Summary

  - [Ruby Version](#Version)
  - [Installation](#Installation)
  - [Validations](#Validations)
  - [Contributing](#contributing)
  - [Authors](#authors)
  - [License](#license)
  - [Acknowledgments](#acknowledgments)

## Version

This code was written in ruby-2.6.1 

## Installation

Clone this repository.

Install the gems:

    $ bundle install

Migrate Databases:
    
    $ rake db:migrate

Add Seed Data (if you want data pre-loaded for testing). This will take a while. Be patient!:

    $rake db:seed

Host the server:

    $ rails s

Go to local web page: http://localhost:3000/

Create a sign up or use any of the seed users. All passwords for seed users are simply: 123
You can also sign in with Facebook if you prefer. Your username will be your email though that is never displayed on the site.

Seed usernames: Kevin, Amanda, Cameron

## Validations

- Usernames can not be used more than once and you can not duplicate a user with the same username but in a different case.
- Monsters must have names and sizes entered to save
- Monster size will change to 5, if you set it under 5 or to 80 if you set it higher than 80.
- Locations must have a name.
- Fights must have a title and a location
- Battle Royale takes a title, but if you leave it blank it will still run with the title (Battle Royale)

## Contributing

Original Code was written by the author, Kevin Hines.

## Authors

  - Kevin Hines

    github: [kevhines](https://github.com/kevhines/)

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.md).

## Acknowledgments

- Thanks to Annabel Wilmerding
- Thanks to my classmates
- Thanks to HBO Max for showing me the trailer to Godzilla vs Kong when I was deciding on a project
- Thanks to The Flatiron School